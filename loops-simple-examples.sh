#!/bin/bash

# Simple Shell Script Loops - Easy Examples
# Real-world scenarios you'll actually use

echo "=== SIMPLE LOOP EXAMPLES ==="
echo

# 1. FOR LOOP - Simple Examples
echo "1. FOR LOOP - Simple Examples"
echo "============================="

# Example 1: Greeting friends
echo "Example 1: Greeting your friends"
friends="Alice Bob Charlie Diana"
for friend in $friends
do
    echo "Hello, $friend! How are you?"
done
echo

# Example 2: Counting files
echo "Example 2: Counting files in current directory"
file_count=0
for file in *
do
    if [ -f "$file" ]; then
        file_count=$((file_count + 1))
        echo "Found file: $file"
    fi
done
echo "Total files: $file_count"
echo

# Example 3: Simple math
echo "Example 3: Creating a simple table"
echo "Number | Square | Cube"
echo "-------|--------|-----"
for num in {1..5}
do
    square=$((num * num))
    cube=$((num * num * num))
    echo "$num      | $square     | $cube"
done
echo

# 2. WHILE LOOP - Simple Examples
echo "2. WHILE LOOP - Simple Examples"
echo "==============================="

# Example 1: Countdown timer
echo "Example 1: Simple countdown"
count=5
while [ $count -gt 0 ]
do
    echo "Countdown: $count"
    sleep 1
    count=$((count - 1))
done
echo "Blast off! 🚀"
echo

# Example 2: Password guessing game
echo "Example 2: Simple password game"
password="secret123"
attempts=0
max_attempts=3

echo "Guess the password (you have $max_attempts attempts):"
while [ $attempts -lt $max_attempts ]
do
    attempts=$((attempts + 1))
    echo -n "Attempt $attempts: "
    read guess
    
    if [ "$guess" = "$password" ]; then
        echo "Correct! You got it in $attempts attempts!"
        break
    else
        echo "Wrong password. Try again."
    fi
done

if [ $attempts -eq $max_attempts ] && [ "$guess" != "$password" ]; then
    echo "Game over! The password was: $password"
fi
echo

# 3. UNTIL LOOP - Simple Examples
echo "3. UNTIL LOOP - Simple Examples"
echo "==============================="

# Example 1: Wait for a file to exist
echo "Example 1: Wait for a file to be created"
echo "Creating a test file in 3 seconds..."
sleep 3
echo "Hello World" > test_file.txt
echo "File created!"
echo

# Example 2: Simple dice game
echo "Example 2: Roll until you get a 6"
rolls=0
until [ $((RANDOM % 6 + 1)) -eq 6 ]
do
    rolls=$((rolls + 1))
    echo "Roll $rolls: Not a 6, try again..."
done
echo "You got a 6 in $rolls rolls!"
echo

# 4. SELECT LOOP - Simple Examples
echo "4. SELECT LOOP - Simple Examples"
echo "================================"

# Example 1: Simple menu
echo "Example 1: Choose your favorite food"
echo "What would you like to eat?"
select food in Pizza Burger Salad Sushi Quit
do
    case $food in
        Pizza)
            echo "Great choice! 🍕"
            break
            ;;
        Burger)
            echo "Delicious! 🍔"
            break
            ;;
        Salad)
            echo "Healthy choice! 🥗"
            break
            ;;
        Sushi)
            echo "Excellent! 🍣"
            break
            ;;
        Quit)
            echo "Goodbye!"
            break
            ;;
        *)
            echo "Please select a valid option (1-5)"
            ;;
    esac
done
echo

# 5. Practical Real-World Examples
echo "5. Practical Real-World Examples"
echo "================================"

# Example 1: Backup multiple files
echo "Example 1: Create backup copies of files"
echo "Creating backup copies..."
for file in *.sh
do
    if [ -f "$file" ]; then
        cp "$file" "${file}.backup"
        echo "Backed up: $file → ${file}.backup"
    fi
done
echo

# Example 2: Check disk space
echo "Example 2: Check disk space for important directories"
directories=("/tmp" "/var/log" "/home")
for dir in "${directories[@]}"
do
    if [ -d "$dir" ]; then
        space=$(df -h "$dir" | tail -1 | awk '{print $5}')
        echo "Directory: $dir - Used space: $space"
    fi
done
echo

# Example 3: Simple calculator
echo "Example 3: Simple calculator"
echo "Enter two numbers and an operation:"
echo -n "First number: "
read num1
echo -n "Second number: "
read num2
echo -n "Operation (+, -, *, /): "
read op

case $op in
    +)
        result=$((num1 + num2))
        echo "$num1 + $num2 = $result"
        ;;
    -)
        result=$((num1 - num2))
        echo "$num1 - $num2 = $result"
        ;;
    \*)
        result=$((num1 * num2))
        echo "$num1 * $num2 = $result"
        ;;
    /)
        if [ $num2 -ne 0 ]; then
            result=$((num1 / num2))
            echo "$num1 / $num2 = $result"
        else
            echo "Error: Division by zero!"
        fi
        ;;
    *)
        echo "Invalid operation!"
        ;;
esac
echo

# 6. Common Patterns
echo "6. Common Loop Patterns"
echo "======================="

# Pattern 1: Process command line arguments
echo "Pattern 1: Process command line arguments"
echo "Arguments provided: $#"
for arg in "$@"
do
    echo "Processing argument: $arg"
done
echo

# Pattern 2: Read file line by line
echo "Pattern 2: Read a file line by line"
echo "Creating a sample file..."
cat > sample.txt << EOF
Line 1: Hello
Line 2: World
Line 3: This is a test
EOF

echo "Reading file contents:"
while IFS= read -r line
do
    echo "Read: $line"
done < sample.txt
rm sample.txt
echo

# Pattern 3: Process array elements
echo "Pattern 3: Process array elements"
colors=("red" "green" "blue" "yellow" "purple")
echo "Available colors:"
for i in "${!colors[@]}"
do
    echo "$((i+1)). ${colors[$i]}"
done
echo

echo "=== ALL EXAMPLES COMPLETED ==="
echo "These examples show common use cases for loops in shell scripting!" 