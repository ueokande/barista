TEST_CASE_COUNT=0
TEST_FAILURES=()
TEST_FAILURE_REASONS=()
TEST_FAILURE_STDERRS=()

function assert_false() {
  TEST_CASE_COUNT=$(($TEST_CASE_COUNT + 1))

  target=$1
  shift

  reason="'$@' must return false"
  stderr=$({ eval $@ ; } 2>&1 >/dev/null)
  if [[ $? -ne 0 ]]; then
    printf '\e[32m.\e[m'
  else
    printf "\e[31mF\e[m"
    TEST_FAILURES=("${TEST_FAILURES[@]}" "$target")
    TEST_FAILURE_REASONS=("${TEST_FAILURE_REASONS[@]}" "$reason")
    TEST_FAILURE_STDERRS=("${TEST_FAILURE_STDERRS[@]}" "$stderr")
  fi
}

function assert_true() {
  TEST_CASE_COUNT=$(($TEST_CASE_COUNT + 1))

  target=$1
  shift

  reason="'$@' must return true"
  stderr=$({ eval $@ ; } 2>&1 >/dev/null)
  if [[ $? -eq 0 ]]; then
    printf '\e[32m.\e[m'
  else
    printf "\e[31mF\e[m"
    TEST_FAILURES=("${TEST_FAILURES[@]:-}" "$target")
    TEST_FAILURE_REASONS=("${TEST_FAILURE_REASONS[@]:-}" "$reason")
    TEST_FAILURE_STDERRS=("${TEST_FAILURE_STDERRS[@]:-}" "$stderr")
  fi
}

finalize_test() {
  printf '\n\n'

  if [[ ${#TEST_FAILURES[@]} -eq 0 ]]; then
    echo "$TEST_CASE_COUNT examples, 0 failure"
    return 0
  else
    local count=1
    echo "Failers:"
    for ((i = 0; i < ${#TEST_FAILURES[@]}; ++i)) {
      printf "%2d) %s\n" $(($i + 1)) "${TEST_FAILURES[$i]}"
      printf "    \e[31m${TEST_FAILURE_REASONS[$i]}\e[m\n"
      printf "    \e[31m${TEST_FAILURE_STDERRS[$i]}\e[m\n"
    }
    echo
    printf "\e[31m$TEST_CASE_COUNT examples, $count failure\e[m\n"
    return 1
  fi
}
