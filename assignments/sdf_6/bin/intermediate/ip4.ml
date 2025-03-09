(*Q: Replicate the Elements of a List a Given Number of Times*)

let rec make_list a n = if (n=0) then [] else a::(make_list a (n-1))
let replicate lst n =
  let rec add_eles lst = match lst with
  |[] -> []
  |x::xs -> List.concat [(make_list x n);(add_eles xs)] in

  add_eles lst;;
  