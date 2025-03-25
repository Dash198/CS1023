let solution x = 
  let rec assign_element lst ln =
    match lst with
    |[] -> ([],[])
    |head::body -> if (ln=1) then (head::(fst (assign_element body 2)), snd (assign_element body 2))
    else (match (List.rev body) with 
    |h::b -> (fst (assign_element (head::(List.rev b)) 1), List.rev (h::List.rev(snd (assign_element (head::(List.rev b)) 1))))
    |[]->([],[head])) in

  assign_element x 1;;

  (*I have used the List.rev function to reverse my list, but here is a manual function for reversing a list*)
  let rev lst = 
    let rec rev_ele ls rls = match ls with
    |[] -> rls
    |head::body -> rev_ele body (head::rls) in
    rev_ele lst [];;

  (**OUTPUT
  Case 1:
  utop # solution [1;2;3;4;5];;
- : int list * int list = ([1; 2; 3], [4; 5])

Case 2:
utop # solution [1;2;3;4;5;6];;
- : int list * int list = ([1; 2; 3], [4; 5; 6])

Case 3:
utop # solution [1];;
- : int list * int list = ([1], [])

Case 4:
utop # solution [];;
- : 'a list * 'a list = ([], [])
**)