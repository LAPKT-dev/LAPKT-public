import sys

if 3 <= sys.version_info[0] and 4 <= sys.version_info[1]:
   import log
else:
   import log2 as log

