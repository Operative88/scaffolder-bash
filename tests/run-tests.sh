#!/bin/bash

# Główny runner - uruchamia wszystkie testy
# Użycie: bash tests/run-tests.sh

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TESTS_DIR="$PROJECT_ROOT/tests"

echo "╔════════════════════════════════════════════╗"
echo "║  Running All Tests - Project Scaffolder    ║"
echo "╚════════════════════════════════════════════╝"
echo ""

TOTAL_PASSED=0
TOTAL_FAILED=0

# Uruchamianie testów bash
echo "📝 Running Bash Script Tests..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if bash "$TESTS_DIR/unit/test-start-project.sh"; then
    TOTAL_PASSED=$((TOTAL_PASSED + 5))
else
    TOTAL_FAILED=$((TOTAL_FAILED + 1))
fi

echo ""
echo "✅ Test Summary:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Total Passed: $TOTAL_PASSED"
echo "Total Failed: $TOTAL_FAILED"

if [ $TOTAL_FAILED -eq 0 ]; then
    echo ""
    echo "🎉 All tests passed!"
    exit 0
else
    echo ""
    echo "❌ Some tests failed"
    exit 1
fi
