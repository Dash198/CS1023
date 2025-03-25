(*Q: Length of a List (4)*)
let length lst =
  let rec len curr_len ls = match ls with
  |[] -> curr_len
  |x::xs -> len (curr_len+1) xs in

  len 0 lst;;