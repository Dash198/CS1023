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
