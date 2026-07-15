import pdfplumber

pdf_path = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\1.Old\L1211 TOP V2.0(1).pdf"

with pdfplumber.open(pdf_path) as pdf:
    print(f"Total pages: {len(pdf.pages)}")
    for i, page in enumerate(pdf.pages):
        text = page.extract_text()
        if text:
            print(f"\n{'='*60}")
            print(f"PAGE {i+1}")
            print(f"{'='*60}")
            # Filter for B1, B1AD, voltage divider related content
            lines = text.split('\n')
            for line in lines:
                # Look for B1-related nets, resistors, voltage references
                upper = line.upper()
                if any(kw in upper for kw in ['B1AD', 'B1 ', 'BAT', 'NLB1', '100K', '10K', 'VCC', 'VBAT', 'B+', 'BAT+', 'BAT-', 'NLB']):
                    print(f"  >>> {line.strip()}")
                else:
                    print(f"  {line.strip()}")
