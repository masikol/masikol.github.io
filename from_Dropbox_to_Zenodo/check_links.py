#!/usr/bin/env python3

import sys

infpath = sys.argv[1]
needle = sys.argv[2]
expected_count = int(sys.argv[3])


with open(infpath, 'rt') as ifh:
    for line in ifh:
        count = line.count(needle)
        if count != 0 and count != expected_count:
            sys.stdout.write(line)
        # end if
    # end for
# end with
