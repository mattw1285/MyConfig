# -*- coding: utf-8 -*-
"""
Created on Sat Jan 17 20:18:20 2026

@author: Matt Wheeler
"""

from pathlib import Path

path = Path(__file__).parent
setups = [
    x for x in path.iterdir('user-data') 
    if x.name != 'base-file']
print('Choices for setup config:')
for x in setups:
    print(f'- {x.name}')
config = input('Pick a config: ')
