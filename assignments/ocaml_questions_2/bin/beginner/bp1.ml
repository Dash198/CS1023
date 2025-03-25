(*Q: Tail of a List (1)*)
let last a=
  let rec find_tail prev lst = match lst with
  |[] -> prev
  |x::xs -> find_tail (Some x) xs in

  find_tail None a