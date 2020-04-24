(* multiplication *)

let rec mult x y =
  if x = 0 then 0 else 
  if x = 1 then y else y + mult (x-1) y;;

(* multiplication terminale *)

let rec mult_term x y =
  if x = 0 then 0 else
  if x = 1 then y else mult (x-1) (y*2);;


(* Mult match term *)

let rec mult_match_term x y =
  match x with
  | 0 -> 0
  | 1 -> y
  | _ -> mult (x-1) (y*2);;

let test = mult_match_term 2 5;;

let res = Printf.printf "%d" test;;