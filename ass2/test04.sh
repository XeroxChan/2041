#! /usr/bin/env dash

# ==============================================================================
# test04.sh
# subset 1 -- Test -f option for command
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
# Test -f option for command
#
#===============================================================================

echo 4q   >  commands.slippy
seq 1 5 | slippy -f commands.slippy > "$actual_output"

cat > "$expected_output" <<EOF
1
2
3
4
EOF

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed 'seq 1 5 | slippy -f commands.slippy' test"
    exit 1
else
    echo "Passed 'seq 1 5 | slippy -f commands.slippy' test"
fi
