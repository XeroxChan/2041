#! /usr/bin/env dash

# ==============================================================================
# test02.sh
# subset 0 -- Test 'd' command
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
# simple delete command 
#
#===============================================================================

seq 4 6 | slippy '2d' > "$actual_output"

cat > "$expected_output" <<EOF
4
6
EOF

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed 'seq 4 6 | slippy '2d'' test"
    exit 1
else
    echo "Passed 'seq 4 6 | slippy '2d'' test"
fi

#===============================================================================
#
# delete out of range
#
#===============================================================================

seq 4 6 | slippy '4d' > "$actual_output"

cat > "$expected_output" <<EOF
4
5
6
EOF

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed 'seq 4 6 | slippy '2d'' test"
    exit 1
else
    echo "Passed 'seq 4 6 | slippy '2d'' test"
fi

#===============================================================================
#
# delete regex
#
#===============================================================================

seq 11 20 | slippy '/[1357]/d' > "$actual_output"

cat > "$expected_output" <<EOF
20
EOF

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed 'seq 11 20 | slippy '/[1357]/d'' test"
    exit 1
else
    echo "Passed 'seq 11 20 | slippy '/[1357]/d'' test"
fi
