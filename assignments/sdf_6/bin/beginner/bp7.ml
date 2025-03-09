(*Q: Duplicate the Elements of a List*)

let rec duplicate lst = match lst with
|[] -> []
|x::xs -> List.concat [[x;x];(duplicate xs)]