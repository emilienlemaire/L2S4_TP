let affiche_string s = 
  Printf.printf "%s\n" s
;;

let f1 i = 
  if i mod 2 = 0 then
    affiche_string "Pair"
  else
    affiche_string "Impair"
;;

let f2 i  =
  affiche_string (if i mod 2 = 0 then "Pair" else "Impair")
;;

let f3 i = 
  let res = if i mod 2 = 0 then "Pair" else "Impair" in
  affiche_string res
;;

let () = f1 1
let () = f1 2
let () = f2 1
let () = f2 2
let () = f3 1
let () = f3 2