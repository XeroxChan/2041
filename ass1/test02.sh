#! /usr/bin/env dash

# ==============================================================================
# test02.sh
# Test the tigger-show error.
#
# Written by: Xeroxchan
# Date: 2022-07-09
# For COMP2041/9044 Assignment 1
# ==============================================================================



PATH="$PATH:$(pwd)"

# Create a temporary directory for the test.
test_dir="$(mktemp -d)"
cd "$test_dir" || exit 1

# Create some files to hold output.

expected_output="$(mktemp)"
actual_output="$(mktemp)"
useless_output="$(mktemp)"

# Remove the temporary directory when the test is done.

trap 'rm "$expected_output" "$actual_output" -rf "$test_dir"' INT HUP QUIT TERM EXIT

tigger-init > "$useless_output"

cat > "$expected_output" <<EOF
usage: tigger-show <commit>:<filename>
EOF

tigger-show > "$actual_output" 2>&1

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed test"
    exit 1
else
    echo "Passed test"
fi
