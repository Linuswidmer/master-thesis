#!/usr/bin/env python3
"""
Character counter for thesis according to supervisor's rules:
- Pure flowing text only (Fließtext)
- Without spaces
- Without tables, figures, indexes (Verzeichnisse), and appendix

Usage:
    python count_characters.py                    # Auto-compile thesis.typ
    python count_characters.py thesis.pdf         # Use existing PDF
    python count_characters.py --no-compile       # Use existing thesis.pdf
"""

import subprocess
import sys
import re
import argparse
from pathlib import Path

try:
    import pymupdf as fitz  # PyMuPDF
except ImportError:
    print("Please install PyMuPDF: pip install pymupdf")
    sys.exit(1)


def compile_typst(typst_file: Path) -> Path:
    """Compile Typst file to PDF."""
    pdf_file = typst_file.with_suffix(".pdf")
    print(f"Compiling {typst_file.name}...")
    result = subprocess.run(
        ["typst", "compile", str(typst_file), str(pdf_file)],
        capture_output=True,
        text=True,
    )
    if result.returncode != 0:
        print(f"Error compiling Typst: {result.stderr}")
        sys.exit(1)
    print(f"Compiled to {pdf_file.name}")
    return pdf_file


def extract_text_from_pdf(pdf_file: Path) -> str:
    """Extract text from PDF using PyMuPDF."""
    doc = fitz.open(pdf_file)
    full_text = ""
    for page in doc:
        full_text += page.get_text()
    doc.close()
    return full_text


def find_section_boundaries(text: str) -> dict:
    """Find start positions of sections to exclude."""
    boundaries = {}

    # Patterns for sections to exclude (case-insensitive)
    exclude_patterns = {
        "table_of_contents": r"^(Table of Contents|Contents|Inhaltsverzeichnis)\s*$",
        "references": r"^(References|Literaturverzeichnis|Bibliography)\s*$",
        "appendix": r"^(Appendix|Anhang)\s*",
        "declaration": r"^(Declaration of Independence|Selbständigkeitserklärung)\s*$",
        "list_of_appendices": r"^(List of Appendices|Anhangverzeichnis)\s*$",
    }

    for name, pattern in exclude_patterns.items():
        match = re.search(pattern, text, re.MULTILINE | re.IGNORECASE)
        if match:
            boundaries[name] = match.start()

    return boundaries


def extract_main_content(text: str) -> str:
    """Extract only the main content (Introduction through Discussion)."""
    boundaries = find_section_boundaries(text)

    # Find where main content starts (after table of contents, before first excluded section)
    # Look for "Introduction" or "1 Introduction" as start marker
    intro_match = re.search(r"^(\d+\s+)?(Introduction|Einleitung)\s*$", text, re.MULTILINE | re.IGNORECASE)

    if intro_match:
        start_pos = intro_match.start()
    else:
        # Fallback: start from beginning
        start_pos = 0
        print("Warning: Could not find Introduction section, starting from beginning")

    # Find where main content ends (first of: References, Declaration, Appendix)
    end_markers = ["references", "declaration", "appendix", "list_of_appendices"]
    end_pos = len(text)

    for marker in end_markers:
        if marker in boundaries and boundaries[marker] < end_pos and boundaries[marker] > start_pos:
            end_pos = boundaries[marker]

    main_content = text[start_pos:end_pos]

    print(f"\nSection boundaries found:")
    print(f"  Main content starts at: {start_pos}")
    print(f"  Main content ends at: {end_pos}")
    for name, pos in sorted(boundaries.items(), key=lambda x: x[1]):
        print(f"  {name}: position {pos}")

    return main_content


def remove_figure_captions(text: str) -> str:
    """Remove figure and table captions."""
    # Remove "Figure X." or "Table X." captions (multi-line)
    text = re.sub(r"^(Figure|Abbildung|Table|Tabelle)\s+\d+[A-Za-z]?\..*?(?=\n\n|\n[A-Z]|\Z)", "", text, flags=re.MULTILINE | re.DOTALL)
    return text


def remove_page_numbers(text: str) -> str:
    """Remove standalone page numbers."""
    text = re.sub(r"^\d+\s*$", "", text, flags=re.MULTILINE)
    return text


def count_characters(text: str, exclude_spaces: bool = True) -> int:
    """Count characters, optionally excluding spaces."""
    if exclude_spaces:
        text = re.sub(r"\s", "", text)
    return len(text)


def main():
    parser = argparse.ArgumentParser(
        description="Count characters in thesis according to supervisor's rules"
    )
    parser.add_argument(
        "pdf_file",
        nargs="?",
        help="Path to PDF file (default: thesis.pdf in script directory)",
    )
    parser.add_argument(
        "--no-compile",
        action="store_true",
        help="Use existing thesis.pdf without compiling",
    )
    parser.add_argument(
        "--compile",
        action="store_true",
        help="Force compilation of thesis.typ",
    )
    args = parser.parse_args()

    script_dir = Path(__file__).parent

    if args.pdf_file:
        # Use provided PDF
        pdf_file = Path(args.pdf_file)
        if not pdf_file.exists():
            print(f"Error: {pdf_file} not found")
            sys.exit(1)
    elif args.compile:
        # Force compile
        typst_file = script_dir / "thesis.typ"
        if not typst_file.exists():
            print(f"Error: {typst_file} not found")
            sys.exit(1)
        pdf_file = compile_typst(typst_file)
    else:
        # Try to use existing PDF, or compile if not found
        pdf_file = script_dir / "thesis.pdf"
        if not pdf_file.exists():
            typst_file = script_dir / "thesis.typ"
            if typst_file.exists():
                print(f"No thesis.pdf found, attempting to compile...")
                pdf_file = compile_typst(typst_file)
            else:
                print(f"Error: Neither thesis.pdf nor thesis.typ found")
                sys.exit(1)
        else:
            print(f"Using existing {pdf_file.name}")

    # Extract text
    print("\nExtracting text from PDF...")
    full_text = extract_text_from_pdf(pdf_file)

    # Extract main content only
    print("\nIdentifying main content sections...")
    main_content = extract_main_content(full_text)

    # Clean up text
    main_content = remove_figure_captions(main_content)
    main_content = remove_page_numbers(main_content)

    # Count characters
    char_count_with_spaces = count_characters(main_content, exclude_spaces=False)
    char_count_no_spaces = count_characters(main_content, exclude_spaces=True)

    # Results
    print("\n" + "=" * 50)
    print("CHARACTER COUNT RESULTS")
    print("=" * 50)
    print(f"Characters (with spaces):    {char_count_with_spaces:,}")
    print(f"Characters (without spaces): {char_count_no_spaces:,}")
    print(f"Maximum allowed:             100,000")
    print(f"Remaining:                   {100_000 - char_count_no_spaces:,}")
    print(f"Usage:                       {char_count_no_spaces / 1000:.1f}%")
    print("=" * 50)

    # Warning if close to or over limit
    if char_count_no_spaces > 100_000:
        print("\n⚠️  WARNING: Over the 100,000 character limit!")
    elif char_count_no_spaces > 90_000:
        print("\n⚠️  Note: Approaching the 100,000 character limit")


if __name__ == "__main__":
    main()
