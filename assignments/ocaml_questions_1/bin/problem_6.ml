(*Q6*)
type shape = {
  radius : float option;
  width : float option;
  height : float option
};;
let solution sh = match sh.radius with
|Some r -> 3.14 *. r *. r
|None -> match sh.width with
        |Some w -> (match sh.height with
                  |Some h -> w *. h
                  |None -> 0.)
        |None -> 0.;;

(*OUTPUT
Case 1:
utop # let circle = { radius = Some 5.0; width = None; height = None };;
val circle : shape =
  {radius = Some 5.; width = None; height = None}
  
utop # solution circle;;
- : float = 78.5

Case 2:
utop # let rectangle = { radius = None; width = Some 4.0; height = Some 3.0 };;
val rectangle : shape =
  {radius = None; width = Some 4.; height = Some 3.}

utop # solution rectangle;;
- : float = 12.

Case 3:
utop # let missing = { radius = None; width = Some 4.0; height = None };;
val missing : shape =
  {radius = None; width = Some 4.; height = None}

utop # solution missing;;
- : float = 0.
*)