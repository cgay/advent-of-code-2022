Module: advent-of-code-2022-test-suite

define test test-find-replacement-index ()
  assert-equal(0, find-replacement-index(20, #[1, 2, 3]));
  assert-equal(1, find-replacement-index(20, #[2, 1, 3]));
  assert-equal(2, find-replacement-index(20, #[2, 3, 1]));
  assert-equal(#f, find-replacement-index(1, #[1, 2, 3]));
end test;

define test test-day-1-sample-data ()
  let counts = #[1000, 2000, 3000, #"blank",
                 4000, #"blank",
                 5000, 6000, #"blank",
                 7000, 8000, 9000, #"blank",
                 10000, #"blank"];
  let (max-elves, max-cals) = find-top-3(counts);
  assert-equal(#[10000, 24000, 11000], max-cals);
end test;
