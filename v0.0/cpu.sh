#!/bin/bash

rm -f test
rm -f cpu.vcd

iverilog -o test cpu_tb.v 

if [ $? -eq 1 ]; then
    echo Source compilation failure
    exit 1
fi

vvp test

if [ $? -ne 0 ]; then
    echo Running simulation failure
    exit 1
fi

gtkwave cpu.gtkw --rcvar 'fontname_signals Monospace 20' --rcvar 'fontname_waves Monospace 18'

if [$? -ne 0]; then
    echo GTKWave failure
    exit 1
fi
