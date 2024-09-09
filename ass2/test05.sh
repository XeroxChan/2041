#! /usr/bin/env dash

# ==============================================================================
# test05.sh
# subset 0 -- Test 's' given address command
#
# Written by: Xeroxchan
# Date: 2022-08-14
# For COMP2041/9044 Assignment 2
# ==============================================================================


PATH="$PATH:$(pwd)"

# Create a temporary directory for the test.
test_dir="$(mktemp -d)"
cd "$test_dir" || exit 1

# Create some files to hold output.
expected_output="$(mktemp)"
actual_output="$(mktemp)"


# Remove the temporary directory when the test is done.

trap 'rm "$expected_output" "$actual_output" -rf "$test_dir"' INT HUP QUIT TERM EXIT

#===============================================================================
#
# given address command
#
#===============================================================================

seq 11 19 | slippy '5s/1/2/' > "$actual_output"

cat > "$expected_output" <<EOF
11
12
13
14
25
16
17
18
19
EOF

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed 'seq 11 19 | slippy '5s/1/2/'' test"
    exit 1
else
    echo "Passed 'seq 11 19 | slippy '5s/1/2/'' test"
fi
