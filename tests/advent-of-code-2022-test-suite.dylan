Module: advent-of-code-2022-test-suite

define test test-register-and-lookup ()
  local method day-n () 42 end;
  register(1, day-n);
  assert-equal(lookup(1), day-n);
end test;

run-test-application()
