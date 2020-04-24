
let rec decomp n d r =
  let res = n / 2 in
  let rem = n mod 2 in
  if res = 0 then
    if rem=0 then r else d*rem + r
  else decomp res (d*10) (d*rem + r)
;;


let exp_rapide a b =
  let dec = decomp b 1 0 in
  let rec exp a dec acc pow =
    let power = if acc=1 && pow=1 then a else pow in
    if dec < 10 then
      if dec = 1 then (acc * power) else acc
    else
    if dec mod 2 = 0 then exp a (dec/10) acc (power*power) else exp a (dec/10) (acc*power) power*power
  in
  exp a dec 1 1
;;

let test = exp_rapide 7 2;;

let res = Printf.printf "%d" test;;