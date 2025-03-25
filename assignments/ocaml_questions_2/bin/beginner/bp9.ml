(*Q: Remove K'th element from a List*)

let remove_at pos lst = 
  let rec rem lst index = match lst with
  |[] -> []
  |x::xs -> if (index=pos) then (rem xs (index+1)) else (x::(rem xs (index+1))) in

  rem lst 0;;