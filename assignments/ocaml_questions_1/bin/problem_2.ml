let rec solution func x = 
  match x with
  |[] -> []
  |head::body -> match (func head) with
                |Some y -> y::(solution func body)
                |None -> solution func body;;

(**OUTPUT
Case 1:
utop # let let_if_even a = if (a mod 2 = 0) then Some a else None;;
val let_if_even : int -> int option = <fun>

utop # solution let_if_even [1;2;3;4;5;6];;
- : int list = [2; 4; 6]

Case 2:
utop # let double_if_gt5 x = if (x>5) then Some (x*2) else None;;
val double_if_gt5 : int -> int option = <fun>

utop # solution double_if_gt5 [1;2;3;4;5;6;7;8;9];;
- : int list = [12; 14; 16; 18]

Case 3:
utop # let always x = None;;
val always : 'a -> 'b option = <fun>

utop # solution always [1;2;3];;
- : 'a list = []
**)