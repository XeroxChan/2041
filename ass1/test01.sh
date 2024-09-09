#! /usr/bin/env dash

# ==============================================================================
# test01.sh
# Test the tigger-init working.
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

expected_output1="$(mktemp)"
expected_output2="$(mktemp)"
actual_output1="$(mktemp)"
actual_output2="$(mktemp)"
useless_output="$(mktemp)"

# Remove the temporary directory when the test is done.

trap 'rm "$expected_output" "$actual_output" -rf "$test_dir"' INT HUP QUIT TERM EXIT
#first time calling
tigger-init > "$actual_output1" 2>&1
#.tigger already exist
tigger-init > "$actual_output2" 2>&1

cat > "$expected_output1" <<EOF
Initialized empty tigger repository in .tigger
EOF

cat > "$expected_output2" <<EOF
/tmp_amd/adams/export/adams/5/z5289835/2041/ass1/tigger-init: error: .tigger already exists
EOF



if ! diff "$expected_output1" "$actual_output1"; then
    echo "Failed test"
    exit 1
else
    echo "Passed test"
fi

if ! diff "$expected_output2" "$actual_output2"; then
    echo "Failed test"
    exit 1
else
    echo "Passed test"
fi
