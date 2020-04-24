let rand = Random.self_init ();;

let bound = int_of_string Sys.argv.(1);;

let arg = Array.length Sys.argv;;
let inputTries = if arg > 2 then int_of_string Sys.argv.(2) else 10;;
let rec deviner_nombre r compt tries=
  let guess = read_int () in
  if (tries-1)=0 then Printf.printf "Vous n'avez pas deviner le nombre, c'était: %d\n" r else
    let str = if r=guess then "Vous avez deviné le nombre" else
      if r < guess then "Le nombre est plus petit" else "Le nombre est plus grand" in
    Printf.printf "%s, il vous reste %d essais" str (tries-1);
    match str with
    | "Vous avez deviné le nombre" -> (Printf.printf " après %d tentatives\n" compt)
    | _ -> Printf.printf "\n"; deviner_nombre r (compt+1) (tries-1)
;;

let nb = Random.int bound;;
let start = deviner_nombre nb 1 inputTries;;
