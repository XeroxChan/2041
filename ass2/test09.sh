#! /usr/bin/env dash

# ==============================================================================
# test09.sh
# subset 1 -- Test different delimeter for 's'
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

seq 1 5 | slippy 'sX[15]XzzzX' > "$actual_output"

cat > "$expected_output" <<EOF
zzz
2
3
4
zzz
EOF

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed 'seq 1 5 | slippy 'sX[15]XzzzX'' test"
    exit 1
else
    echo "Passed 'seq 1 5 | slippy 'sX[15]XzzzX'' test"
fi
