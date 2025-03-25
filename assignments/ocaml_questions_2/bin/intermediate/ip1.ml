(*Q: Decode a Run-Length Encoded List*)

type 'a encoding =
|One of 'a
|Many of (int*'a)

let rec make_list freq a =
  let rec add_eles curr =
  if(curr=freq) then [a] else (a::(add_eles (curr+1))) in
  add_eles 1
let decode enc_lst =
  let rec add_eles enc_lst = match enc_lst with
  |[] -> []
  |x::xs -> (match x with
  |One a -> [a]
  |Many (freq,a) -> make_list freq a) :: (add_eles xs) in

  add_eles enc_lst