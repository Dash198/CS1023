(*Q: Modified Run-Length Encoding*)

type 'a encoding = One of 'a | Many of (int*'a)

let encode lst = 
  let rec find_run_freq curr freq lst = match lst with
  |[] -> let enc = (if freq = 1 then One(curr) else Many(freq,curr)) in [enc]
  |x::xs -> if (x=curr) then (find_run_freq curr (freq+1) xs) else let enc = (if freq = 1 then One(curr) else Many(freq,curr)) in
    (enc::(find_run_freq x 1 xs)) in
  
  find_run_freq (List.nth lst 0) 0 lst;;

