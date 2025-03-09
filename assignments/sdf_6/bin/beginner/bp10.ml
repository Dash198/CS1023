(*Q: Insert Element at a Given Position in a List*)

let insert_at ele pos lst =
  let rec insert ele index lst = match lst with
  |[] -> [ele]
  |x::xs -> if (index=pos) then List.concat [[ele;x];xs] else x::(insert ele (index+1) xs) in
insert ele 0 lst;;