#!/usr/bin/env python
import csv
is_header = True
with open('urls.csv', 'rU') as csvfile:
     spamreader = csv.reader(csvfile, dialect=csv.excel_tab)
     for row in spamreader:
         if is_header:
             is_header = False
             continue
         print ', '.join(row)
