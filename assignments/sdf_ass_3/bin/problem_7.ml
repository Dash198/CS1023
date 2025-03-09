(*Q7*)
exception NotFound of (int*int);;
let solution func lst =
  let rec check func int_lst index = match int_lst with
  |[] -> raise (NotFound (index-1,index)) (*returns last index searched + length of list (according to question)*)
  |head::body -> if (func head) then index else (check func body (index+1)) in

  check func lst 0;;

(*OUTPUT:
Case 1:
utop # solution (fun x -> x mod 2 = 0) [1;3;6;7];;
- : int = 2

Case 2:
utop # solution (fun x -> x mod 2 = 0) [1;3;5;7];;
Exception: NotFound (3, 4).

Case 3:
utop # solution (fun x -> x mod 2 = 0) [];;
Exception: NotFound (-1, 0).*)