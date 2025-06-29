#!/bin/bash

# Shell Redirectors - Complete Guide with Examples
# Redirectors help us control where input comes from and where output goes

echo "=== SHELL REDIRECTORS TUTORIAL ==="
echo

# 1. BASIC CONCEPTS
echo "1. BASIC CONCEPTS"
echo "================"
echo "• Input:  Data coming INTO a command (usually from keyboard)"
echo "• Output: Data going OUT from a command (usually to terminal)"
echo "• Redirectors: Change where input comes from or output goes to"
echo

# 2. OUTPUT REDIRECTION (>)
echo "2. OUTPUT REDIRECTION (>)"
echo "========================="
echo "• > : Redirects output to a file (overwrites existing content)"
echo "• >> : Redirects output to a file (appends to existing content)"
echo

# Example 1: Basic output redirection
echo "Example 1: Save command output to a file"
echo "Creating a file with echo command..."
echo "Hello World" > output.txt
echo "File created! Check output.txt"
echo "Content of output.txt:"
cat output.txt
echo

# Example 2: Save command output
echo "Example 2: Save ls command output to file"
ls -la > file_list.txt
echo "File list saved to file_list.txt"
echo "First few lines of file_list.txt:"
head -3 file_list.txt
echo

# Example 3: Append to file
echo "Example 3: Append text to existing file"
echo "First line" > log.txt
echo "Second line" >> log.txt
echo "Third line" >> log.txt
echo "Log file content:"
cat log.txt
echo

# 3. INPUT REDIRECTION (<)
echo "3. INPUT REDIRECTION (<)"
echo "========================"
echo "• < : Takes input from a file instead of keyboard"
echo

# Example 1: Read file content
echo "Example 1: Count words in a file"
echo "Creating a sample text file..."
cat > sample.txt << EOF
This is a sample text file.
It contains multiple lines of text.
We will use this to demonstrate input redirection.
EOF

echo "Counting words in sample.txt:"
wc -w < sample.txt
echo

# Example 2: Sort file content
echo "Example 2: Sort lines from a file"
echo "Creating a file with unsorted names..."
cat > names.txt << EOF
Charlie
Alice
Bob
Diana
EOF

echo "Original names:"
cat names.txt
echo
echo "Sorted names:"
sort < names.txt
echo

# 4. PIPES (|)
echo "4. PIPES (|)"
echo "============"
echo "• | : Connects output of one command to input of another"
echo

# Example 1: Basic pipe
echo "Example 1: Count files in directory"
echo "Number of files in current directory:"
ls | wc -l
echo

# Example 2: Filter output
echo "Example 2: Find shell scripts"
echo "Shell script files:"
ls *.sh 2>/dev/null | head -5
echo

# Example 3: Multiple pipes
echo "Example 3: Complex pipe chain"
echo "Files sorted by size (largest first):"
ls -la | grep "^-" | sort -k5 -nr | head -3
echo

# 5. ERROR REDIRECTION (2>)
echo "5. ERROR REDIRECTION (2>)"
echo "========================="
echo "• 2> : Redirects error messages to a file"
echo "• 2>> : Appends error messages to a file"
echo

# Example 1: Redirect errors
echo "Example 1: Redirect error messages"
echo "Trying to access non-existent file..."
ls nonexistent_file 2> error.log
echo "Error message saved to error.log:"
cat error.log
echo

# Example 2: Suppress errors
echo "Example 2: Suppress error messages"
echo "Trying to remove non-existent files (errors suppressed):"
rm nonexistent_file1 nonexistent_file2 2>/dev/null
echo "Command completed (errors were hidden)"
echo

# 6. COMBINED REDIRECTION
echo "6. COMBINED REDIRECTION"
echo "======================="
echo "• &> : Redirects both output and errors to same file"
echo "• &>> : Appends both output and errors to same file"
echo

# Example 1: Redirect both output and errors
echo "Example 1: Save both output and errors"
echo "Running command that produces both output and errors..."
ls -la existing_file nonexistent_file &> combined.log
echo "Combined output and errors saved to combined.log:"
cat combined.log
echo

# 7. HERE DOCUMENTS (<<)
echo "7. HERE DOCUMENTS (<<)"
echo "======================"
echo "• << : Creates input from text within the script"
echo

# Example 1: Create file with here document
echo "Example 1: Create configuration file"
cat > config.txt << EOF
# Configuration File
# Created on $(date)
USER=admin
HOST=localhost
PORT=8080
DEBUG=true
EOF

echo "Configuration file created:"
cat config.txt
echo

# Example 2: Interactive input simulation
echo "Example 2: Simulate user input"
echo "Simulating 'yes' responses to a command:"
yes | head -5
echo

# 8. PRACTICAL EXAMPLES
echo "8. PRACTICAL EXAMPLES"
echo "===================="

# Example 1: Log file creation
echo "Example 1: Create a log file"
echo "$(date): Script started" > script.log
echo "Processing files..." >> script.log
ls *.sh >> script.log 2>&1
echo "$(date): Script completed" >> script.log
echo "Log file created:"
cat script.log
echo

# Example 2: Backup with logging
echo "Example 2: Backup files with logging"
echo "Creating backup directory..."
mkdir -p backup 2>/dev/null
echo "Backing up shell scripts..."
for file in *.sh
do
    if [ -f "$file" ]; then
        cp "$file" "backup/${file}.bak" 2>>backup.log
        echo "Backed up: $file" >> backup.log
    fi
done
echo "Backup completed. Check backup.log for details."
echo

# Example 3: Data processing pipeline
echo "Example 3: Data processing pipeline"
echo "Creating data file..."
cat > data.txt << EOF
apple,5
banana,3
orange,7
grape,2
EOF

echo "Processing data (sorting by quantity):"
cat data.txt | sort -t',' -k2 -nr
echo

# 9. COMMON PATTERNS
echo "9. COMMON PATTERNS"
echo "=================="

# Pattern 1: Silent execution
echo "Pattern 1: Silent execution (no output)"
echo "Running command silently..."
ls -la > /dev/null 2>&1
echo "Command completed without any output"
echo

# Pattern 2: Conditional output
echo "Pattern 2: Conditional output"
echo "Checking if file exists..."
if [ -f "output.txt" ]; then
    echo "File exists" > status.log
else
    echo "File not found" > status.log
fi
echo "Status saved to status.log"
echo

# Pattern 3: Multiple outputs
echo "Pattern 3: Multiple outputs"
echo "Saving output to file and displaying on screen:"
ls *.sh | tee file_list.txt | wc -l
echo "File count displayed above, full list saved to file_list.txt"
echo

# 10. REDIRECTOR SUMMARY
echo "10. REDIRECTOR SUMMARY"
echo "======================"
echo "• >    : Output to file (overwrite)"
echo "• >>   : Output to file (append)"
echo "• <    : Input from file"
echo "• |    : Pipe (output to input)"
echo "• 2>   : Error to file (overwrite)"
echo "• 2>>  : Error to file (append)"
echo "• &>   : Output + Error to file (overwrite)"
echo "• &>>  : Output + Error to file (append)"
echo "• <<   : Here document (input from script)"
echo "• /dev/null : Discard output (black hole)"
echo

# Cleanup temporary files
echo "Cleaning up temporary files..."
rm -f output.txt file_list.txt log.txt sample.txt names.txt error.log combined.log config.txt script.log backup.log data.txt status.txt file_list.txt
rm -rf backup
echo "Cleanup completed!"
echo

echo "=== REDIRECTOR TUTORIAL COMPLETED ==="
echo "Key takeaway: Redirectors help you control data flow in shell scripts!" 