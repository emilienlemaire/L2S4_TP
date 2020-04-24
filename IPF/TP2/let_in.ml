let f a n =
  let rec g n acc =
    if n=0 then (acc+1) else
    if n mod 2 = 0 then g (n-1) (acc+1) else g (n-1) (acc-1)
  in
  let s = g n 0 in
  if a > s then Printf.printf "%d > %d\n" a s else Printf.printf "%d < %d\n" a s
;;

let test = f 12 1;;
let test2 = f 12 5;;

let test3 = f 0 2;;