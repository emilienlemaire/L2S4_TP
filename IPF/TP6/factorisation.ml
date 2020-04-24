let shortestDivider n =
  if n < 2 then
    failwith "Select a number over 2"
  else
    let rec divider num div =
      if num mod div = 0 then
        div
      else
        divider num (div+1)
    in
    divider n 2
;;

let reverse l =
  let rec rev o r =
    match o with
      | [] -> r
      | hd::tl -> rev tl ([hd]@r)
  in
  rev l []
;;

let rec print_list l =
  match l with
    | [] -> Printf.printf "\n"
    | hd::tl ->
      begin
        Printf.printf "%d " hd;
        print_list tl;
      end
;;

let factorSlow n =
  let rec factors d l =
    let div = shortestDivider d in
    if div = d then
      (l@[d])
    else
      factors (d/div) (l@[div])
  in
  factors n []
;;


print_list(factorSlow 24);;
print_list(factorSlow 1300);;

let shortestDividerUpper n d =
  let r = (sqrt (float_of_int n)) in
  let rec divider num div =
    if (float_of_int div) > r then
      num
    else
      if num mod div = 0 then
        div
      else
        divider num (div+2)
  in
  if d = 2 then
    if n mod d = 0 then
      d
    else
      divider n (d+1)
  else
    if d mod 2 = 0 then
      divider n (d+1)
    else
      divider n d
;;

let factorFaster n =
  let rec factors num d l =
    let div = shortestDividerUpper num d in
    if div = num then
      (l@[num])
    else
      factors (num/div) div (l@[div])
  in
  factors n 2 []
;;

print_list (factorFaster 24);;
print_list (factorFaster 1300);;
print_list (factorFaster 100000001);;
print_list (factorFaster 1000000001);;
