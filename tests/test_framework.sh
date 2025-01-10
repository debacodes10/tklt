#!/bin/bash

PASS=0
FAIL=0

assert_equals() {
    local actual="$1"
    local expected="$2"
    local message="$3"

    if [[ "$actual" == "$expected" ]]; then
        echo "✅ $message"
        PASS=$((PASS + 1))
    else
        echo "❌ $message"
        echo "   Expected: $expected"
        echo "   Actual:   $actual"
        FAIL=$((FAIL + 1))
    fi
}

summary() {
    echo "Test Summary:"
    echo "   Passed: $PASS"
    echo "   Failed: $FAIL"
    [[ $FAIL -eq 0 ]] && exit 0 || exit 1
}
