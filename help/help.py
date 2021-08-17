#!/usr/bin/env python3

import os
from typing import OrderedDict

COLUMN_SPACING = 4

buf = []
for filename in os.environ['MAKEFILE_LIST'].strip().split(' '):
    with open(filename) as f:
        buf += f.readlines()

lines = [line for line in buf if "#info" in line]
lines.sort()

instructions = OrderedDict()
longest_target = 0

for line in lines:
    split = line.split(':')
    target = split[0]
    cmd = split[1].split('#')[1]
    info = split[2].rstrip()

    if "info" == cmd:
        instructions[target] = info

    if "info?" in cmd:
        varname = cmd.split('?')[1]

        if varname in os.environ:
            instructions[target] = info

    if len(target) > longest_target:
        longest_target = len(target)

print("These are the public targets available:\n")

for k, v in instructions.items():
    spacing = " " * (longest_target + COLUMN_SPACING - len(k))
    print('\033[1;37m{}\033[0;0m{}{}'.format(k, spacing, v))
