exception ParseFailed of string
let solution str = try
  let ls = String.split_on_char ',' str in
  List.map (fun x -> int_of_string x) ls
with Failure "int_of_string"-> raise (ParseFailed "Make sure to enter COMMA-SEPARATED INTEGERS!");;

(*OUTPUT
Case 1:
utop # solution "1,2,3,4,5";;
- : int list = [1; 2; 3; 4; 5]

Case 2:
utop # solution "1,a,3";;
Exception: ParseFailed "Make sure to enter COMMA-SEPARATED INTEGERS!".

Case 3:
utop # solution "";;
Exception: ParseFailed "Make sure to enter COMMA-SEPARATED INTEGERS!".*)