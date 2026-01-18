# -*- coding: utf-8 -*-
"""
Created on Sat Jan 17 20:18:20 2026

@author: Matt Wheeler
"""
## Default Libraries ##
from pathlib import Path
import sys


if len(sys.argv) != 2:
    sys.exit("Usage: python3 my_file.py <mnt_location>")
mnt_path = Path(sys.argv[1])


path = Path(__file__).parent /'cloud-init'
setups = [
    x for x in (path /'user-data').iterdir()
    if x.name != 'base-file'
]
print('Choices for setup config:')
for x in setups:
    print(f'- {x.stem}')
config = input('Pick a config: ')
if config not in [x.stem for x in setups]:
    print('Not a valid settup!')
    sys.exit(1)


if (path /'network-config'/config).exists():
    pass
elif (path /'meta-data'/config).exists():
    pass
