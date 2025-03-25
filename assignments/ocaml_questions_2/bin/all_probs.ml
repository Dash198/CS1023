(*BEGINNER QUESTIONS*)

(*Q1: Tail of a List*)
let last a=
  let rec find_tail prev lst = match lst with
  |[] -> prev
  |x::xs -> find_tail (Some x) xs in

  find_tail None a

(*Q2: N'th Element of a List*)
let at pos lst =
  let rec iter index ls = match ls with
  |[] -> None
  |x::xs -> if (pos = index) then (Some x) else iter (index+1) xs in

  iter 0 lst;;

(*Q3: Length of a List*)
let length lst =
  let rec len curr_len ls = match ls with
  |[] -> curr_len
  |x::xs -> len (curr_len+1) xs in

  len 0 lst;;

(*Q4: Reverse a List*)
let rev lst = 
  let rec rev_lst curr left = match left with
  |[] -> curr
  |x::xs -> rev_lst (x::curr) xs in

  rev_lst [] lst;;

(*Q: Run-Length Encoding*)
let encode lst = 
  let rec find_run_freq curr freq lst = match lst with
  |[] -> [(freq,curr)]
  |x::xs -> if (x=curr) then (find_run_freq curr (freq+1) xs) else 
    ((freq,curr)::(find_run_freq x 1 xs)) in
  
  find_run_freq (List.nth lst 0) 0 lst;;

(*Q: Modified Run-Length Encoding*)
type 'a encoding = One of 'a | Many of (int*'a)

let encode lst = 
  let rec find_run_freq curr freq lst = match lst with
  |[] -> let enc = (if freq = 1 then One(curr) else Many(freq,curr)) in [enc]
  |x::xs -> if (x=curr) then (find_run_freq curr (freq+1) xs) else let enc = (if freq = 1 then One(curr) else Many(freq,curr)) in
    (enc::(find_run_freq x 1 xs)) in
  
  find_run_freq (List.nth lst 0) 0 lst;;

(*Q7: Duplicate the Elements of a List*)
let rec duplicate lst = match lst with
|[] -> []
|x::xs -> List.concat [[x;x];(duplicate xs)]

(*Q8: Split a List into Two Parts; Length of the First Part is Given*)
let split lst len =
  let rec add_ele curr_lst lst curr_index = match lst with
  |[] -> (List.rev (fst curr_lst), List.rev (snd curr_lst))
  |x::xs -> if (curr_index<len) then add_ele (x::(fst curr_lst), (snd curr_lst)) xs (curr_index+1)
  else add_ele ((fst curr_lst), (x::(snd curr_lst))) xs (curr_index+1) in

  add_ele ([],[]) lst 0;;

(*Q: Remove K'th element from a List*)

let remove_at pos lst = 
  let rec rem lst index = match lst with
  |[] -> []
  |x::xs -> if (index=pos) then (rem xs (index+1)) else (x::(rem xs (index+1))) in

  rem lst 0;;

(*Q10: Insert Element at a Given Position in a List*)
let insert_at ele pos lst =
  let rec insert ele index lst = match lst with
  |[] -> [ele]
  |x::xs -> if (index=pos) then List.concat [[ele;x];xs] else x::(insert ele (index+1) xs) in
  insert ele 0 lst


(*INTERMEDIATE QUESTIONS*)

(*Q1: Decode a Run-Length Encoded List*)
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

(*Q2: Pack Consecutive Duplicates*)
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

(*Q3: Eliminate Duplicates in a List*)
let compress lst = 
  let rec elim current lst = match lst with
  |[] -> [current]
  |x::xs -> if (current=x) then (elim current xs) else (current::(elim x xs)) in

  elim (List.nth lst 0) lst;;

(*Q4: Replicate the Elements of a List a Given Number of Times*)
let rec make_list a n = if (n=0) then [] else a::(make_list a (n-1))
let replicate lst n =
  let rec add_eles lst = match lst with
  |[] -> []
  |x::xs -> List.concat [(make_list x n);(add_eles xs)] in

  add_eles lst;;

(*Q5: Determine the Greatest Common Divisor of Two Positive Integer Numbers*)
let rec gcd a b = if (b=0) then a else (gcd b (a mod b))


(*ADVANCED QUESTIONS*)

(*Q: Huffman Coding*)
type 'a hTree = Leaf of ('a * int) | Branch of ('a hTree * 'a hTree * int)

let get_f node = match node with
|Leaf (_,f) -> f
|Branch (_,_,f) -> f

let rec sort lst = 
  let rec insert x lst = match lst with
  |[] -> [x]
  |head::tail -> if (get_f x)<=(get_f head) then (x::head::tail) else (head::(insert x tail)) in

  match lst with
  |[] -> []
  |x::xs -> insert x (sort xs)

let rec make_huffman_tree fs =
  let rec merge_nodes ls = match (sort ls) with
  |[final_tree] -> final_tree
  |Leaf (x1,f1) :: Leaf (x2,f2) :: tail -> let merged = Branch (Leaf (x1,f1), Leaf (x2,f2), (f1+f2)) in merge_nodes (merged::tail)
  |Leaf(x1,f1) :: Branch (x2,x3,f2) :: tail -> let merged = Branch (Leaf(x1,f1), Branch (x2,x3,f2), (f1+f2)) in merge_nodes (merged::tail)
  |Branch (x2,x3,f2) :: Leaf (x1,f1) :: tail -> let merged = Branch (Branch (x2,x3,f2), Leaf (x1,f1),(f1+f2)) in merge_nodes (merged::tail)
  |Branch (x1,x2,f1) :: Branch (x3,x4,f2) :: tail -> let merged = Branch (Branch (x1,x2,f1), Branch (x3,x4,f2), (f1+f2)) in merge_nodes (merged::tail) in

  merge_nodes fs

let make_leaves ls = List.map (fun (x,f) -> Leaf (x,f)) ls

let assign_encoding ht =
  let rec encode_level prefix dir tr =
    let encoding = prefix^(string_of_int dir) in
    match tr with
    |Leaf (x,_) -> [(x,encoding)]
    |Branch (t1,t2,_) -> List.concat [(encode_level encoding 0 t1); (encode_level encoding 1 t2)] in
  
  match ht with
  |Leaf (x,_) -> [(x,"0")]
  |Branch (t1,t2,_) -> List.concat [(encode_level "" 0 t1); (encode_level "" 1 t2)]

let huffman fs = assign_encoding(make_huffman_tree (make_leaves(fs)))
  