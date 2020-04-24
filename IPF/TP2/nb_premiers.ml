let rec div_between a b n =
  if n mod a = 0 then true else
  if a = b || a > b then false else div_between (a+1) b n
;;

let is_prime n =
  if n=2 then true else div_between 2 (n-1) n
;;

let no_div_from a n =
  if div_between a (n-1) n then false else true
;;

(* Fonction is_prime2 à faire *)

let test = is_prime 123547;;

let res = Printf.printf "%b" test;;