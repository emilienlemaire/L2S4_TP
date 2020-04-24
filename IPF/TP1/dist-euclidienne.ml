let dist x1 x2 y1 y2 =
  let  x = (x1 -. x2) *. (x1 -. x2) in
  let  y = (y1 -. y2) *. (y1 -. y2) in
  sqrt(x +. y)
;;


let affiche_float f = 
  Printf.printf "%f\n" f
;;

let res = dist 0. 1. 12. 56.

let () = affiche_float res;;