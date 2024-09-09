#! /usr/bin/env dash

# ==============================================================================
# test03.sh
# subset 0 -- Test 's' command
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
# simple substitute command 
#
#===============================================================================

seq 1 5 | slippy 's/[15]/zzz/' > "$actual_output"

cat > "$expected_output" <<EOF
zzz
2
3
4
zzz
EOF

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed 'seq 1 5 | slippy 's/[15]/zzz/'' test"
    exit 1
else
    echo "Passed 'seq 1 5 | slippy 's/[15]/zzz/'' test"
fi

#===============================================================================
#
# substitute command  with g
#
#===============================================================================

echo Hello Xerox | slippy 's/e//g' > "$actual_output"

cat > "$expected_output" <<EOF
Hllo Xrox
EOF

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed 'echo Hello Xerox | slippy 's/e//g'' test"
    exit 1
else
    echo "Passed 'echo Hello Xerox | slippy 's/e//g'' test"
fi
