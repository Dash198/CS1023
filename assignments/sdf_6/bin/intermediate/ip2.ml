(*Q: Pack Consecutive Duplicates*)

let rec make_list freq a =
  let rec add_eles curr =
  if(curr=freq) then [a] else (a::(add_eles (curr+1))) in
  add_eles 1

let pack lst = 
  let rec make_packs lst curr curr_freq= match lst with
  |[] -> []
  |x::xs -> if (x=curr) then (make_packs xs curr (curr_freq+1)) else
    (make_list curr_freq curr)::(make_packs xs x 1) in
  
    make_packs lst (List.nth lst 0) 0;;