#!/bin/bash

# Shell Functions Tutorial
# Functions in shell allow you to group commands together and reuse them

echo "=== Shell Functions Tutorial ==="
echo

# Method 1: Basic function syntax
# Syntax: function_name() { commands; }
echo "1. Basic Function Syntax:"
echo "   function_name() { commands; }"
echo

# Example 1: Simple function
greet() {
    echo "Hello, World!"
}

echo "Calling greet function:"
greet
echo

# Method 2: Using 'function' keyword
# Syntax: function function_name { commands; }
echo "2. Using 'function' keyword:"
echo "   function function_name { commands; }"
echo

# Example 2: Function with parameters
function greet_user() {
    local name=$1  # $1 is the first parameter
    echo "Hello, $name! Welcome to shell scripting!"
}

echo "Calling greet_user function with parameter:"
greet_user "John"
echo

# Example 3: Function with multiple parameters
function add_numbers() {
    local num1=$1
    local num2=$2
    local result=$((num1 + num2))
    echo "Sum of $num1 and $num2 is: $result"
}

echo "Calling add_numbers function:"
add_numbers 10 20
echo

# Example 4: Function that returns a value (using echo)
function multiply() {
    local a=$1
    local b=$2
    local product=$((a * b))
    echo $product  # This is how we "return" a value
}

echo "Calling multiply function and capturing result:"
result=$(multiply 5 6)
echo "Product of 5 and 6 is: $result"
echo

# Example 5: Function with default parameters
function create_file() {
    local filename=${1:-"default.txt"}  # Default value if no parameter provided
    local content=${2:-"Default content"}
    
    echo "$content" > "$filename"
    echo "Created file: $filename with content: $content"
}

echo "Calling create_file with parameters:"
create_file "test.txt" "Hello from function!"
echo

echo "Calling create_file without parameters (using defaults):"
create_file
echo

# Example 6: Function that checks if a number is even
function is_even() {
    local num=$1
    if [ $((num % 2)) -eq 0 ]; then
        echo "true"
    else
        echo "false"
    fi
}

echo "Checking if numbers are even:"
echo "Is 10 even? $(is_even 10)"
echo "Is 7 even? $(is_even 7)"
echo

# Example 7: Function with local variables
function calculate_area() {
    local length=$1
    local width=$2
    local area=$((length * width))
    local perimeter=$((2 * (length + width)))
    
    echo "Rectangle with length $length and width $width:"
    echo "  Area: $area"
    echo "  Perimeter: $perimeter"
}

echo "Calling calculate_area function:"
calculate_area 5 3
echo

# Example 8: Function that uses global variables
global_counter=0

function increment_counter() {
    global_counter=$((global_counter + 1))
    echo "Counter incremented to: $global_counter"
}

echo "Using global variable in function:"
increment_counter
increment_counter
increment_counter
echo "Final counter value: $global_counter"
echo

# Example 9: Function with conditional logic
function check_age() {
    local age=$1
    
    if [ "$age" -lt 18 ]; then
        echo "You are a minor"
    elif [ "$age" -ge 18 ] && [ "$age" -lt 65 ]; then
        echo "You are an adult"
    else
        echo "You are a senior"
    fi
}

echo "Checking age categories:"
check_age 15
check_age 25
check_age 70
echo

# Example 10: Function that processes command line arguments
function process_args() {
    echo "Number of arguments: $#"
    echo "All arguments: $@"
    
    for arg in "$@"; do
        echo "Processing argument: $arg"
    done
}

echo "Calling process_args with multiple arguments:"
process_args "apple" "banana" "cherry"
echo

# Example 11: Function with error handling
function divide_numbers() {
    local dividend=$1
    local divisor=$2
    
    if [ "$divisor" -eq 0 ]; then
        echo "Error: Division by zero!" >&2
        return 1  # Return error code
    fi
    
    local result=$((dividend / divisor))
    echo "Result: $result"
    return 0  # Return success code
}

echo "Testing divide_numbers function:"
divide_numbers 10 2
divide_numbers 10 0
echo "Exit code of last command: $?"
echo

# Example 12: Function that creates a backup
function create_backup() {
    local source_file=$1
    local backup_dir=${2:-"./backup"}
    
    # Check if source file exists
    if [ ! -f "$source_file" ]; then
        echo "Error: Source file '$source_file' does not exist!" >&2
        return 1
    fi
    
    # Create backup directory if it doesn't exist
    mkdir -p "$backup_dir"
    
    # Create backup with timestamp
    local timestamp=$(date +"%Y%m%d_%H%M%S")
    local backup_file="$backup_dir/$(basename "$source_file").backup.$timestamp"
    
    cp "$source_file" "$backup_file"
    echo "Backup created: $backup_file"
}

echo "Creating a test file for backup:"
echo "This is a test file" > test_file.txt
echo "Calling create_backup function:"
create_backup "test_file.txt"
echo

# Example 13: Recursive function (factorial)
function factorial() {
    local n=$1
    
    if [ "$n" -le 1 ]; then
        echo 1
    else
        local prev=$(factorial $((n - 1)))
        echo $((n * prev))
    fi
}

echo "Calculating factorial using recursive function:"
echo "Factorial of 5: $(factorial 5)"
echo

# Example 14: Function that returns multiple values (using arrays)
function get_user_info() {
    local username=$1
    local name="John Doe"
    local age=30
    local city="New York"
    
    # Return multiple values as array
    echo "$name $age $city"
}

echo "Getting user info:"
user_info=($(get_user_info "john"))
echo "Name: ${user_info[0]}"
echo "Age: ${user_info[1]}"
echo "City: ${user_info[2]}"
echo

# Example 15: Function with help/usage information
function show_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  -h, --help     Show this help message"
    echo "  -v, --version  Show version information"
    echo "  -f FILE        Process specified file"
}

# Example of how to use the function
echo "Showing usage information:"
show_usage
echo

echo "=== Function Syntax Summary ==="
echo "1. function_name() { commands; }"
echo "2. function function_name { commands; }"
echo "3. Parameters: \$1, \$2, \$3, etc."
echo "4. All arguments: \$@"
echo "5. Number of arguments: \$#"
echo "6. Return values: use 'echo' and capture with \$()"
echo "7. Exit codes: use 'return' statement"
echo "8. Local variables: use 'local' keyword"
echo

echo "=== Best Practices ==="
echo "1. Use descriptive function names"
echo "2. Use local variables when possible"
echo "3. Provide default values for parameters"
echo "4. Handle errors and return appropriate exit codes"
echo "5. Document your functions with comments"
echo "6. Use meaningful parameter names"
echo

echo "Tutorial completed! You now know how to create and use functions in shell scripting."
