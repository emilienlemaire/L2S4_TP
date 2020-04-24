let rec sum acc n =
  if n = 0. then acc else sum (n +. acc) (n -. 1.)
;;

let i = sum 0. 3.;;

Printf.printf "%f\n" i;;


let rec sum2 acc n =
  match n with
  | 0. -> acc
  | _ -> sum2 (n +. acc) (n -. 1.)
;;


let j = sum2 0. 3.;;

Printf.printf "%f\n" j;;

let even_odd x = if x mod 2 = 0 then "Pair" else "Impair"

let borne_sup x =
  match (even_odd x) with
  | "Pair" -> float x /. 2.
  | _ -> -1.
;;

let res = borne_sup 2;;

Printf.printf "%f\n" res;;

let res2 = borne_sup 1;;

Printf.printf "%f\n" res2;;