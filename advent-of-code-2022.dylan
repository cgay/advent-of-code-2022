Module: advent-of-code-2022-impl

// Each day implementation will register itself here.

define constant $days = make(<table>);  // 1 => day-1

define function register
    (day :: <integer>, fn :: <function>) => ()
  $days[day] := fn;
end;

define function lookup
    (day :: <integer>) => (fn :: false-or(<function>))
  element($days, day, default: #f)
end;
