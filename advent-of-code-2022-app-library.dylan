Module: dylan-user
Synopsis: Module and library definition for executable application

define library advent-of-code-2022-app
  use common-dylan;
  use advent-of-code-2022;
  use io, import: { format-out };
end library;

define module advent-of-code-2022-app
  use common-dylan;
  use format-out;
  use advent-of-code-2022;
end module;
