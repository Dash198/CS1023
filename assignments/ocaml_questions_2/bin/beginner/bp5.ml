(*Q: Run-Length Encoding (7)*)
let encode lst = 
  let rec find_run_freq curr freq lst = match lst with
  |[] -> [(freq,curr)]
  |x::xs -> if (x=curr) then (find_run_freq curr (freq+1) xs) else 
    ((freq,curr)::(find_run_freq x 1 xs)) in
  
  find_run_freq (List.nth lst 0) 0 lst;;