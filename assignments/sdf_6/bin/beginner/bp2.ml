(*Q: N'th Element of a List (3)*)
let at pos lst =
  let rec iter index ls = match ls with
  |[] -> None
  |x::xs -> if (pos = index) then (Some x) else iter (index+1) xs in

  iter 0 lst;;