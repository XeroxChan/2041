#! /usr/bin/env dash

# ==============================================================================
# test08.sh
# subset 0 -- Test -n option
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
# -n for 'p'
#
#===============================================================================

seq 1 5 | slippy -n '3p' > "$actual_output"

cat > "$expected_output" <<EOF
3
EOF

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed 'seq 1 5 | slippy -n '3p'' test"
    exit 1
else
    echo "Passed 'seq 1 5 | slippy -n '3p'' test"
fi

#===============================================================================
#
# -n for 'd'
#
#===============================================================================

seq 1 5 | slippy -n '3d' > "$actual_output"

cat > "$expected_output" <<EOF
EOF

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed 'seq 1 5 | slippy -n '3d'' test"
    exit 1
else
    echo "Passed 'seq 1 5 | slippy -n '3d'' test"
fi
