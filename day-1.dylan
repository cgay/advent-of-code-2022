Module: advent-of-code-2022-impl

define constant $blank = #"blank";

define function day-1 (filename :: <string>)
  let counts = read-calorie-counts(filename);
  let (elf, calories)
    = iterate loop (i = 0, cal = 0, elf = 1, max-elf = 0, max-calories = 0)
        //format-out("loop(%=, %=, %=, %=, %=)\n", i, cal, elf, max-elf, max-calories);
        if (i >= counts.size)
          values(max-elf, max-calories)
        else
          let calories = counts[i];
          if (calories == $blank)
            if (cal > max-calories)
              loop(i + 1, 0, elf + 1, elf, cal)
            else
              loop(i + 1, 0, elf + 1, max-elf, max-calories)
            end
          else
            loop(i + 1, cal + calories, elf, max-elf, max-calories)
          end
        end
      end iterate;
  format-out("Elf: %=, calories: %=\n", elf, calories);
end function;

define function read-calorie-counts
    (filename :: <string>) => (counts :: <sequence>)
  let counts = make(<stretchy-vector>);
  with-open-file (stream = filename)
    block (return)
      while (#t)
        let line = read-line(stream, on-end-of-stream: #f);
        select (line by \=)
          #f =>
            add!(counts, $blank);
            return();
          "" =>
            add!(counts, $blank);
          otherwise =>
            let cals = string-to-integer(line);
            add!(counts, cals);
        end
      end while;
    end block;
  end;
  counts
end function;

register(1, day-1);
