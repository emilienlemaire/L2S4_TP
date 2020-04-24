type hanoi = {t1: int list; t2: int list; t3: int list};;

let check t =
  let rec check_next t n =
    match t with
      | [] -> true
      | hd::tl ->
        if hd > n then
          check_next tl hd
        else
          false
  in
  check_next t 0
;;

let make l1 l2 l3 =
  assert (check l1);
  assert (check l2);
  assert (check l3);
  {t1 = l1; t2 = l2; t3 = l3}
;;

let hd_tl_opt l =
  match l with
    | []  -> None, []
    | hd::tl -> Some hd, tl
;;

let combine l1 l2 l3 =
  let r1 = List.rev l1 in
  let r2 = List.rev l2 in
  let r3 = List.rev l3 in
  let rec combine_rev r1 r2 r3 res = 
    let hd1, tl1 = hd_tl_opt r1 in
    let hd2, tl2 = hd_tl_opt r2 in
    let hd3, tl3 = hd_tl_opt r3 in
    match hd1, hd2, hd3 with
      | None, None, None -> res
      | _ -> combine_rev tl1 tl2 tl3 ([hd1, hd2, hd3]@res)
  in
  combine_rev r1 r2 r3 []
;;

let print_option opt =
  match opt with
    | None -> Printf.printf "    "
    | Some i -> Printf.printf "%4i" i
;;

let rec print_list l =
  match l with
    | [] -> ()
    | (x, y, z)::tl ->
      print_option x;
      print_option y;
      print_option z;
      Printf.printf "\n";
      print_list tl
;;


let print_hanoi h =
  let l = combine h.t1 h.t2 h.t3 in
  print_list l;
  Printf.printf "============\n"
;;

let h = make [1; 4] [2] [3; 5; 6];;

let move t1 t2 =
  match t1 with
    | [] -> t1, t2
    | hd::tl -> tl, hd::t2
;;

let play h src dst =
  match src, dst with
    | 1, 2 -> 
      let t1, t2 = move h.t1 h.t2 in
      make t1 t2 h.t3
    | 1, 3 -> 
      let t1, t3 = move h.t1 h.t3 in
      make t1 h.t2 t3 
    | 2, 1 -> 
      let t2, t1 = move h.t2 h.t1 in
      make t1 t2 h.t3
    | 2, 3 ->
      let t2, t3 = move h.t2 h.t3 in
      make h.t1 t2 t3
    | 3, 1 ->
      let t3, t1 = move h.t3 h.t1 in
      make t1 h.t2 t3
    | 3, 2 ->
      let t3, t2 = move h.t3 h.t2 in
      make h.t1 t2 t3
    | _ -> h
;;

let compute n src dst aux =
  let rec make_tower n res =
    if n = 0 then
      res
    else
      make_tower (n-1) (n::res)
  in
  let t =  make_tower n [] in
  let h =
    match src with
      | 1 -> make t [] []
      | 2 -> make [] t []
      | 3 -> make [] [] t
      | _ -> failwith ("Invalid number of towers: dst = " ^ (string_of_int src) ^ " dst = " ^ (string_of_int dst) ^ " aux = " ^ (string_of_int aux) ^ " all values must be between 1 and 3 included")
  in
  if src = dst then
    []
  else
    let rec moves n src dst aux res =
      if n = 1 then 
        (res@[(src,dst)])
      else
        (moves (n-1) src aux dst res)@(moves 1 src dst aux res)@(moves (n-1) aux dst src res)
    in
    let rec hanois h m res =
      match m with
        | [] -> (res@[h])
        | (src, dst)::tl -> hanois (play h src dst) tl (res@[h]) 
    in
    let game = moves n src dst aux [] in
    hanois h game []
;;

let rec print_game g =
  match g with
    | [] -> ()
    | hd::tl ->
      print_hanoi hd;
      print_game tl
;;

print_game (compute 5 1 3 2);;


