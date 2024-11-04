# HLA Matching Zero-Knowledge Proof

This Zero-Knowledge Proof (ZKP) demonstrates that a donor and recipient have at least a certain number of matching Human Leukocyte Antigen (HLA) markers, which is crucial for organ transplantation compatibility, without revealing any sensitive genetic information.

### How HLA Matching for Organ Transplants Works

HLA markers are proteins found on the surface of cells that play a significant role in the immune system's ability to recognize foreign substances. In organ transplantation, matching HLA markers between donor and recipient reduces the risk of organ rejection. Typically, there are 10 key HLA markers, and a higher number of matches indicates better compatibility.

### What the ZKP Proves

The donor and recipient have at least 7 matching HLA markers out of 10.
No actual HLA marker values are revealed, preserving privacy.

### Input Descriptions
Donor's HLA Markers (HLA_d): An array of 10 integers representing the donor's HLA markers.
Recipient's HLA Markers (HLA_r): An array of 10 integers representing the recipient's HLA markers.

### Instructions
Enter the donor's and recipient's HLA markers. Each list should contain exactly 10 integers separated by commas. The HLA markers are integers representing specific genetic markers.