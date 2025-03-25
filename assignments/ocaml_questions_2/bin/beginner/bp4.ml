(*Q: Reverse a List (5)*)
let rev lst = 
  let rec rev_lst curr left = match left with
  |[] -> curr
  |x::xs -> rev_lst (x::curr) xs in

  rev_lst [] lst;;