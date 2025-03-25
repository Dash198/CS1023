(*Q: Eliminate Duplicates in a List*)

let compress lst = 
  let rec elim current lst = match lst with
  |[] -> [current]
  |x::xs -> if (current=x) then (elim current xs) else (current::(elim x xs)) in

  elim (List.nth lst 0) lst;;