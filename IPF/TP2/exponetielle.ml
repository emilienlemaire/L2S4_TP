let rec exp e n =
  if n = 0 then 1 else e * exp e (n-1);;

let test = exp 2 3;;

let res = Printf.printf "%d\n" test;;

let exp_term e n =
  let rec f e n acc = 
    if n = 0 then acc else f e (n-1) acc*e in
  f e n 1;
;;
let test2 = exp_term 2 3;;
let test3 = exp_term 7 2;;

let res = Printf.printf "%d %d\n" test2 test3;;