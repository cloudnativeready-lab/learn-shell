#!/bin/bash

# Shell Variables Tutorial
# This script demonstrates different types of shell variables and their usage

echo "=== Shell Variables Tutorial ==="
echo

# 1. Basic Variable Assignment
echo "1. Basic Variable Assignment:"
name="John Doe"
age=25
echo "Name: $name"
echo "Age: $age"
echo

# 2. Variable Declaration with 'declare'
echo "2. Variable Declaration with 'declare':"
declare -i number=42
declare -r readonly_var="This cannot be changed"
echo "Integer variable: $number"
echo "Readonly variable: $readonly_var"
echo

# 3. Environment Variables
echo "3. Environment Variables:"
echo "Current user: $USER"
echo "Home directory: $HOME"
echo "Current working directory: $PWD"
echo "Shell: $SHELL"
echo

# 4. Local Variables (function scope)
echo "4. Local Variables in Functions:"
demo_function() {
    local local_var="I'm local to this function"
    echo "Inside function: $local_var"
}
demo_function
echo

# 5. Variable Expansion and Substitution
echo "5. Variable Expansion and Substitution:"
filename="document.txt"
echo "Original filename: $filename"
echo "Without extension: ${filename%.txt}"
echo "Uppercase: ${filename^^}"
echo "Length: ${#filename}"
echo

# 6. Default Values
echo "6. Default Values:"
unset undefined_var
echo "With default value: ${undefined_var:-"Default Value"}"
echo "With default value (set if undefined): ${undefined_var:="New Default"}"
echo

# 7. Command Substitution
echo "7. Command Substitution:"
current_date=$(date)
file_count=$(ls | wc -l)
echo "Current date: $current_date"
echo "Number of files in current directory: $file_count"
echo

# 8. Arithmetic Operations
echo "8. Arithmetic Operations:"
x=10
y=5
sum=$((x + y))
product=$((x * y))
echo "x = $x, y = $y"
echo "Sum: $sum"
echo "Product: $product"
echo

# 9. String Operations
echo "9. String Operations:"
text="Hello World"
echo "Original text: $text"
echo "Length: ${#text}"
echo "First 5 characters: ${text:0:5}"
echo "Replace 'World' with 'Bash': ${text/World/Bash}"
echo

# 10. Array Variables
echo "10. Array Variables:"
fruits=("apple" "banana" "orange" "grape")
echo "Fruits array: ${fruits[@]}"
echo "First fruit: ${fruits[0]}"
echo "Number of fruits: ${#fruits[@]}"
echo

# 11. Special Variables
echo "11. Special Variables:"
echo "Script name: $0"
echo "Number of arguments: $#"
echo "All arguments: $@"
echo "First argument: $1"
echo "Last command exit status: $?"
echo

# 12. Variable Scope Example
echo "12. Variable Scope Example:"
global_var="I'm global"

scope_demo() {
    local local_var="I'm local"
    echo "Inside function - Global: $global_var"
    echo "Inside function - Local: $local_var"
}

scope_demo
echo "Outside function - Global: $global_var"
echo "Outside function - Local: $local_var (should be empty)"
echo

# 13. Best Practices
echo "13. Best Practices:"
# Use descriptive names
user_first_name="Alice"
user_last_name="Smith"
# Use quotes to handle spaces and special characters
full_name="$user_first_name $user_last_name"
echo "Full name: $full_name"

# Use constants for configuration
readonly MAX_RETRIES=3
readonly LOG_FILE="/var/log/app.log"
echo "Max retries: $MAX_RETRIES"
echo "Log file: $LOG_FILE"
echo

# 14. Variable Validation
echo "14. Variable Validation:"
check_var=""
if [ -z "$check_var" ]; then
    echo "Variable is empty"
fi

if [ -n "$name" ]; then
    echo "Name variable is not empty: $name"
fi
echo

echo "=== End of Shell Variables Tutorial ==="
