#! /usr/bin/env dash

# ==============================================================================
# test01.sh
# subset 0 -- Test 'p' command
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
# simple print command 
#
#===============================================================================

seq 4 6 | slippy '2p' > "$actual_output"

cat > "$expected_output" <<EOF
4
5
5
6
EOF

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed 'seq 4 6 | slippy '2p'' test"
    exit 1
else
    echo "Passed 'seq 4 6 | slippy '2p'' test"
fi

#===============================================================================
#
# print out of range
#
#===============================================================================

seq 4 6 | slippy '4p' > "$actual_output"

cat > "$expected_output" <<EOF
4
5
6
EOF

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed 'seq 4 6 | slippy '4p'' test"
    exit 1
else
    echo "Passed 'seq 4 6 | slippy '4p'' test"
fi

#===============================================================================
#
# print command with regular expression
#
#===============================================================================

seq 65 85 | 2041 slippy '/^7/p' > "$actual_output"

cat > "$expected_output" <<EOF
65
66
67
68
69
70
70
71
71
72
72
73
73
74
74
75
75
76
76
77
77
78
78
79
79
80
81
82
83
84
85
EOF

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed 'seq 65 85 | 2041 slippy '/^7/p'' test"
    exit 1
else
    echo "Passed 'seq 65 85 | 2041 slippy '/^7/p'' test"
fi

#===============================================================================
#
# 'p'
#
#===============================================================================

seq 1 5 | slippy 'p' > "$actual_output"

cat > "$expected_output" <<EOF
1
1
2
2
3
3
4
4
5
5
EOF

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed 'seq 1 5 | slippy 'p'' test"
    exit 1
else
    echo "Passed 'seq 1 5 | slippy 'p'' test"
fi
