(*Q5*)
let solution x y = if y = 0 then None else Some (x/y);;

(*Alternative method with try-with block*)
let solution_t x y = try (Some (x/y)) with Division_by_zero -> None;; 
(*OUTPUT
Case 1:
utop # solution 10 2;;
- : int option = Some 5

Case 2:
utop # solution 10 0;;
- : int option = None

Case 3:
utop # solution (-10) 2;;
- : int option = Some (-5)

Case 4:
utop # solution 0 2;;
- : int option = Some 0
*)