type t1 = Fruits of string | Legumes of string;;
type t = Fruit | Legume;;

let l = [ ("pomme", Fruit); ("orange", Fruit); ("banane", Fruit); ("citron", Fruit); ("poire", Fruit); ("pomme de terre", Legume); ("tomate", Legume); ("courgette", Legume) ];;

let rec print_fruit l =
  match l with
  | [] -> ()
  | hd::tl -> if (snd hd) = Fruit then begin 
      Printf.printf "%s\n" (fst hd);
      print_fruit tl;
    end
    else print_fruit tl
;;

let rec print_list = function 
    [] -> Printf.printf "\n"
  | e::l -> Printf.printf "%s" (fst e) ; print_string " " ; print_list l

let fruit_legume l =
  let rec fruits l l1 =
    match l with
    | [] -> l1
    | hd::tl -> if (snd hd) = Fruit then hd::(fruits tl l1) else fruits tl l1
  in
  let rec legumes l l2 =
    match l with
    | [] -> l2
    | hd::tl -> if (snd hd) = Legume then hd::(legumes tl l2) else legumes tl l2
  in
  let l1 = fruits l [] in
  let l2 = legumes l [] in
  (l1, l2);
;;

let test = fruit_legume l;;
let res1 = print_list (fst test);;
let res1 = print_list (snd test);;

let to_t1 aliment =
  match snd aliment with
  | Fruit -> Fruits(fst aliment)
  | Legume -> Legumes(fst aliment)
;;

let res = to_t1 ("pomme", Fruit);;

let print_t1 t1 =
  match t1 with
  | Fruits(n) -> Printf.printf "Fruit %s" n
  | Legumes(n) -> Printf.printf "Légume %s" n
;;

let test = print_t1 res;;
