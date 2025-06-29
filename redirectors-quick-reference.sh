#!/bin/bash

# Quick Reference: Shell Redirectors
# Simple examples for everyday use

echo "=== QUICK REFERENCE: SHELL REDIRECTORS ==="
echo

echo "1. OUTPUT REDIRECTION"
echo "====================="
echo "Save output to file (overwrite):"
echo "ls -la > file_list.txt"
echo

echo "Save output to file (append):"
echo "echo 'New line' >> log.txt"
echo

echo "2. INPUT REDIRECTION"
echo "===================="
echo "Read from file:"
echo "sort < unsorted.txt"
echo

echo "3. PIPES"
echo "========"
echo "Connect commands:"
echo "ls | grep .txt"
echo "cat file.txt | wc -l"
echo

echo "4. ERROR REDIRECTION"
echo "===================="
echo "Save errors to file:"
echo "ls nonexistent 2> error.log"
echo

echo "Hide errors:"
echo "rm file 2>/dev/null"
echo

echo "5. COMBINED REDIRECTION"
echo "======================="
echo "Save both output and errors:"
echo "command &> output.log"
echo

echo "6. HERE DOCUMENTS"
echo "================="
echo "Create file from script:"
echo "cat > config.txt << EOF"
echo "setting=value"
echo "EOF"
echo

echo "7. PRACTICAL EXAMPLES"
echo "====================="
echo "• Log command output:"
echo "  command >> log.txt 2>&1"
echo

echo "• Count files silently:"
echo "  ls | wc -l > /dev/null"
echo

echo "• Backup with timestamp:"
echo "  cp file.txt backup/file_$(date +%Y%m%d).txt"
echo

echo "• Filter and save:"
echo "  grep 'error' log.txt > errors_only.txt"
echo

echo "8. COMMON PATTERNS"
echo "=================="
echo "• Silent execution: command > /dev/null 2>&1"
echo "• Log everything: command &>> log.txt"
echo "• Display and save: command | tee output.txt"
echo "• Conditional output: [ -f file ] && echo 'exists' > status.txt"
echo

echo "=== END OF QUICK REFERENCE ===" 