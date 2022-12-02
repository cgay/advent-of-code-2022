Module: dylan-user

define library advent-of-code-2022
  use common-dylan;
  use io,
    import: { format-out, streams };
  use system,
    import: { file-system };

  export
    advent-of-code-2022,
    advent-of-code-2022-impl;
end library;

define module advent-of-code-2022
  create
    lookup,                     // lookup(1) => day-1 function
    register;                   // register(1, day-1)
end module;

define module advent-of-code-2022-impl
  use advent-of-code-2022;
  use common-dylan;
  use file-system;
  use format-out;
  use streams;
end module;
