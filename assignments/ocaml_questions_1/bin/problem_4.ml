(*Q4 i*)
let rec solution lst = match lst with
|[] -> []
|head::body -> (List.append head (solution body));;

(*Again, I have used a library function to append elements, here is an implementation of the same.
A manual implementation of the List.rev function has already been done in problem_1.*)
let append a b =
  let rec add_eles ls fls = match ls with
  |[] -> fls
  |head::body -> add_eles body (head::fls) in
  add_eles (List.rev a) (add_eles (List.rev b) [])

(*My attempt to make the function tail-recursive*)
 let solution_t lst = 
    let lst = List.rev lst in
    let rec t_flatten ls f_lst = match ls with
    |[] -> f_lst
    |head::body -> t_flatten body (List.append head f_lst) in
  
    t_flatten lst [];;

(*OUTPUT
Case 1:
utop # solution [];;
- : 'a list = []

Case 2:
utop # solution [[1;2;3]];;
- : int list = [1; 2; 3]

Case 3:
utop # solution [[1;2];[3;4];[5;6]];;
- : int list = [1; 2; 3; 4; 5; 6]

Case 4:
utop # solution [[1;2];[];[3;4];[]];;
- : int list = [1; 2; 3; 4]
*)