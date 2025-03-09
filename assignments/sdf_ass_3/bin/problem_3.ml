type 'a tree = {
  head : 'a;
  child1 : 'a tree option;
  child2 : 'a tree option
};;
let rec solution func tr = {
  head = func tr.head;
  child1 = (match tr.child1 with
  |Some child -> Some (solution func child)
  |None -> None);
  child2 = (match tr.child2 with
  |Some child -> Some (solution func child)
  |None -> None)
};;

(**OUTPUT
Case 1:
utop # let tr = { head = 1; child1 = None; child2 = None };;
val tr : int tree = {head = 1; child1 = None; child2 = None}

utop # let inc x = x + 1;;
val inc : int -> int = <fun>

utop # solution inc tr;;
- : int tree = {head = 2; child1 = None; child2 = None}

Case 2:
utop # let tr = { 
  head = 2; 
  child1 = Some { head = 3; child1 = None; child2 = None }; 
  child2 = Some { head = 4; child1 = None; child2 = None } 
};;
val tr : int tree =
  {head = 2;
   child1 = Some {head = 3; child1 = None; child2 = None};
   child2 = Some {head = 4; child1 = None; child2 = None}}
   
let double x = x * 2;;
val double : int -> int = <fun>

solution double tr;;
- : int tree =
{head = 4;
 child1 = Some {head = 6; child1 = None; child2 = None};
 child2 = Some {head = 8; child1 = None; child2 = None}}
 
Case 3:
utop # let tr = { 
  head = 5; 
  child1 = None; 
  child2 = Some { head = 7; child1 = None; child2 = None } 
};;
val tr : int tree =
  {head = 5; child1 = None;
   child2 = Some {head = 7; child1 = None; child2 = None}}
   
let neg x = -x;;
val neg : int -> int = <fun>

utop # solution neg tr;;
- : int tree =
{head = -5; child1 = None;
 child2 = Some {head = -7; child1 = None; child2 = None}}
 **)