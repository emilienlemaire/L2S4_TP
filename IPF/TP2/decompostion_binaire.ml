let decomposition_binaire n =
  let rec decomp n s =
    let res = n / 2 in
    let rem = n mod 2 in
    let str = string_of_int rem in
    if res = 0 then if rem = 0 then s else "1"^s
    else decomp res (str^s)
  in
  decomp n ""
;;

let test = if Array.length Sys.argv > 1 then
    decomposition_binaire (int_of_string Sys.argv.(1)) else
    decomposition_binaire 23;;

let res = Printf.printf "%s\n" test;;