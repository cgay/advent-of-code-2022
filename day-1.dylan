Module: advent-of-code-2022-impl

define constant $blank = #"blank";

define function day-1 (filename :: <string>)
  let counts = read-calorie-counts(filename);
  let (max-elves, max-cals) = find-top-3(counts);
  format-out("elves: %=, calories: %=, total: %=\n",
             max-elves, max-cals, reduce(\+, 0, max-cals));
end function;

define function find-top-3 (counts) => (elves, cals)
  let max-elves = vector(0, 0, 0);
  let max-cals = vector(0, 0, 0);
  iterate loop (i = 0, cals = 0, elf = 0)
    if (i < counts.size)
      let calories = counts[i];
      if (calories == $blank)
        let j = find-replacement-index(cals, max-cals);
        if (j)
          max-cals[j] := cals;
          max-elves[j] := elf;
        end;
        loop(i + 1, 0, elf + 1);
      else
        loop(i + 1, cals + calories, elf)
      end
    end
  end iterate;
  values(max-elves, max-cals)
end function;

// Find the index of the smallest item in maxes that is smaller than cals.  We
// could just sort, but I decided to do it this way because it's a little more
// efficient.
define function find-replacement-index
    (cals :: <integer>, maxes :: <sequence>) => (i :: false-or(<integer>))
  iterate loop (i = 0, smallest-i = #f, smallest-c = $maximum-integer)
    if (i < maxes.size)
      let c = maxes[i];
      if (cals > c & c < smallest-c)
        loop(i + 1, i, c)
      else
        loop(i + 1, smallest-i, smallest-c)
      end
    else
      smallest-i
    end
  end
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
