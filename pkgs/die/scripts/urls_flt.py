import os
import sys

def ok(l):
    if 'readline' in os.path.basename(l):
        return True

    if l[-1] == '\\':
        return False

    if '.' not in os.path.basename(l):
        return False

    return True

def it():
    for l in sys.stdin.read().split('\n'):
        l = l.strip()

        if l and ok(l):
            yield l

print('\n'.join(sorted(frozenset(it()))).strip() + '\n')
