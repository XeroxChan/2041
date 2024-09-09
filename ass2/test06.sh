#! /usr/bin/env dash

# ==============================================================================
# test06.sh
# subset 0 -- Test 's' given address command with g flag
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

seq 51 60 | slippy '5s/5/9/g' > "$actual_output"

cat > "$expected_output" <<EOF
51
52
53
54
99
56
57
58
59
60
EOF

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed 'seq 51 60 | slippy '5s/5/9/g'' test"
    exit 1
else
    echo "Passed 'seq 51 60 | slippy '5s/5/9/g'' test"
fi
