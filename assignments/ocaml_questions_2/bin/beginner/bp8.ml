(*Q: Split a List into Two Parts; Length of the First Part is Given*)

let split lst len =
  let rec add_ele curr_lst lst curr_index = match lst with
  |[] -> (List.rev (fst curr_lst), List.rev (snd curr_lst))
  |x::xs -> if (curr_index<len) then add_ele (x::(fst curr_lst), (snd curr_lst)) xs (curr_index+1)
  else add_ele ((fst curr_lst), (x::(snd curr_lst))) xs (curr_index+1) in

  add_ele ([],[]) lst 0;;