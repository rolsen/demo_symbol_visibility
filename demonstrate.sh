#!/usr/bin/env sh

echo "Without -fvisibility=hidden:"
make clean && make && ./test
echo
echo "With -fvisibility=hidden:"
make clean && SO_CFLAGS=-fvisibility=hidden make && ./test
