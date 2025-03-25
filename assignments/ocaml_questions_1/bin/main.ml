(*Q1*)
let split x = 
  let rec assign_element lst ln =
    match lst with
    |[] -> ([],[])
    |head::body -> if (ln=1) then (head::(fst (assign_element body 2)), snd (assign_element body 2))
    else (match (List.rev body) with 
    |h::b -> (fst (assign_element (head::(List.rev b)) 1), List.rev (h::List.rev(snd (assign_element (head::(List.rev b)) 1))))
    |[]->([],[head])) in

  assign_element x 1;;


(*Q2*)
let rec filter_map func x = 
  match x with
  |[] -> []
  |head::body -> match (func head) with
                |Some y -> y::(filter_map func body)
                |None -> filter_map func body;;


(*Q3*)
type 'a tree = {
  head : 'a;
  child1 : 'a tree option;
  child2 : 'a tree option
};;
let rec tree_map func tr = {
  head = func tr.head;
  child1 = (match tr.child1 with
  |Some child -> Some (tree_map func child)
  |None -> None);
  child2 = (match tr.child2 with
  |Some child -> Some (tree_map func child)
  |None -> None)
};;


(*Q6*)
type shape = {
  radius : float option;
  width : float option;
  height : float option
};;
let area sh = match sh.radius with
|Some r -> 3.14 *. r *. r
|None -> match sh.width with
        |Some w -> match sh.height with
                  Some h -> w *. h;;


(*Q5*)
let safe_div x y = if y = 0 then None else Some (x/y);;
let safe_div x y = try (Some (x/y)) with Division_by_zero -> None;; 


(*Q4 i*)
let rec flatten lst = match lst with
|[] -> []
|head::body -> (List.append head (flatten body));;

(*Q4 ii*)
let flatten_t lst = 
  let lst = List.rev lst in
  let rec t_flatten ls f_lst = match ls with
  |[] -> f_lst
  |head::body -> t_flatten body (List.append head f_lst) in

  t_flatten lst [];;


(*Q7*)
exception NotFound of (int*int);;
let find_index func lst =
  let rec check func int_lst index = match int_lst with
  |[] -> raise (NotFound (index-1,index))
  |head::body -> if (func head) then index else (check func body (index+1)) in

  check func lst 0;;


(*Q8*)
exception ParseFailed of string
let parse_int_list str = try
  let ls = String.split_on_char ',' str in
  List.map (fun x -> int_of_string x) ls
with Failure _-> raise (ParseFailed "Make sure to enter COMMA-SEPARATED INTEGERS!");;


let tr = {
  head = 1;
  child1 = Some {
    head = 7;
    child1 = Some {
      head = 2;
      child1 = None;
      child2 = None;
    };
    child2 = Some {
      head = 6;
      child1 = Some {
        head = 5;
        child1 = None;
        child2 = None;
      };
      child2 = Some {
        head = 11;
        child1 = None;
        child2 = None;
      };
    };
  }; 
  child2 = Some {
    head = 9;
    child1 = None;
    child2 = Some {
      head = 9;
      child1 = Some {
        head = 6;
        child1 = None;
        child2 = None;
      };
      child2 = None;
    };
  };
};;

