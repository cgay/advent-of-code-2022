Module: advent-of-code-2022-app

define function main
    (name :: <string>, arguments :: <vector>)
  if (empty?(arguments))
    format-out("Usage: %s <day-number> [<day-specific-arg> ...]\n", name);
    exit-application(2);
  end;

  let day = string-to-integer(arguments[0]);
  let day-fn = lookup(day)
    | error("nothing for day %d yet!", day);
  apply(day-fn, copy-sequence(arguments, start: 1));
end function;

main(application-name(), application-arguments());
