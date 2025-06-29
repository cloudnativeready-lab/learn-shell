#!/bin/bash

# Shell Script Loops - Types and Examples
# This script demonstrates different types of loops available in shell scripting

echo "=== SHELL SCRIPT LOOPS TUTORIAL ==="
echo

# 1. FOR LOOP
echo "1. FOR LOOP EXAMPLES:"
echo "---------------------"

# Basic for loop with list
echo "a) Basic for loop with list:"
for fruit in apple banana orange grape
do
    echo "I like $fruit"
done
echo

# For loop with range (C-style)
echo "b) For loop with range (C-style):"
for ((i=1; i<=5; i++))
do
    echo "Count: $i"
done
echo

# For loop with sequence
echo "c) For loop with sequence:"
for i in {1..5}
do
    echo "Number: $i"
done
echo

# For loop with step
echo "d) For loop with step:"
for i in {0..10..2}
do
    echo "Even number: $i"
done
echo

# For loop with command output
echo "e) For loop with command output:"
for file in $(ls *.sh 2>/dev/null)
do
    echo "Shell script: $file"
done
echo

# 2. WHILE LOOP
echo "2. WHILE LOOP EXAMPLES:"
echo "----------------------"

# Basic while loop
echo "a) Basic while loop:"
counter=1
while [ $counter -le 5 ]
do
    echo "While loop iteration: $counter"
    counter=$((counter + 1))
done
echo

# While loop with user input
echo "b) While loop with user input (type 'quit' to exit):"
echo "Enter names (type 'quit' to stop):"
while read name
do
    if [ "$name" = "quit" ]; then
        break
    fi
    echo "Hello, $name!"
done
echo

# While loop with file reading
echo "c) While loop reading from a file:"
echo "Creating a sample file..."
echo "Line 1" > temp_file.txt
echo "Line 2" >> temp_file.txt
echo "Line 3" >> temp_file.txt

echo "Reading file line by line:"
while IFS= read -r line
do
    echo "Read: $line"
done < temp_file.txt
rm temp_file.txt
echo

# 3. UNTIL LOOP
echo "3. UNTIL LOOP EXAMPLES:"
echo "----------------------"

# Basic until loop
echo "a) Basic until loop:"
counter=1
until [ $counter -gt 5 ]
do
    echo "Until loop iteration: $counter"
    counter=$((counter + 1))
done
echo

# Until loop with condition
echo "b) Until loop waiting for condition:"
random_num=$((RANDOM % 10 + 1))
echo "Random number generated: $random_num"
attempts=0
until [ $attempts -eq $random_num ]
do
    attempts=$((attempts + 1))
    echo "Attempt $attempts"
done
echo "Reached the target!"
echo

# 4. SELECT LOOP
echo "4. SELECT LOOP EXAMPLES:"
echo "-----------------------"

# Basic select loop
echo "a) Basic select loop:"
echo "Choose your favorite color:"
select color in red green blue yellow quit
do
    case $color in
        red|green|blue|yellow)
            echo "You selected: $color"
            break
            ;;
        quit)
            echo "Goodbye!"
            break
            ;;
        *)
            echo "Invalid selection. Please try again."
            ;;
    esac
done
echo

# 5. NESTED LOOPS
echo "5. NESTED LOOPS EXAMPLE:"
echo "-----------------------"

echo "Multiplication table (1-3):"
for i in {1..3}
do
    for j in {1..3}
    do
        result=$((i * j))
        echo -n "$i x $j = $result  "
    done
    echo
done
echo

# 6. LOOP CONTROL STATEMENTS
echo "6. LOOP CONTROL STATEMENTS:"
echo "---------------------------"

# Break statement
echo "a) Break statement example:"
for i in {1..10}
do
    if [ $i -eq 6 ]; then
        echo "Breaking at $i"
        break
    fi
    echo "Processing: $i"
done
echo

# Continue statement
echo "b) Continue statement example:"
for i in {1..10}
do
    if [ $i -eq 5 ]; then
        echo "Skipping $i"
        continue
    fi
    echo "Processing: $i"
done
echo

# 7. PRACTICAL EXAMPLES
echo "7. PRACTICAL EXAMPLES:"
echo "--------------------"

# File processing
echo "a) Processing files in current directory:"
echo "Files in current directory:"
for file in *
do
    if [ -f "$file" ]; then
        size=$(wc -c < "$file")
        echo "File: $file (Size: ${size} bytes)"
    fi
done
echo

# Array processing
echo "b) Processing arrays:"
fruits=("apple" "banana" "cherry" "date" "elderberry")
echo "Fruits array:"
for i in "${!fruits[@]}"
do
    echo "Index $i: ${fruits[$i]}"
done
echo

# Command line arguments
echo "c) Processing command line arguments:"
echo "Number of arguments: $#"
for arg in "$@"
do
    echo "Argument: $arg"
done
echo

# 8. INFINITE LOOPS
echo "8. INFINITE LOOPS (with safety):"
echo "-------------------------------"

echo "a) Infinite loop with break condition:"
count=0
while true
do
    count=$((count + 1))
    echo "Infinite loop iteration: $count"
    if [ $count -ge 3 ]; then
        echo "Breaking infinite loop"
        break
    fi
done
echo

echo "=== LOOP TUTORIAL COMPLETED ==="
echo "Key points to remember:"
echo "- for: iterate over lists, ranges, or command output"
echo "- while: loop while condition is true"
echo "- until: loop until condition becomes true"
echo "- select: create interactive menus"
echo "- break: exit the loop"
echo "- continue: skip to next iteration"
