type epreuve = Course | Tir | Equitation | Natation | Escrime;;
type epreuve_score = Pair of epreuve * int;;
type joueur = { id: int; competition: epreuve_score list };;
type ponderation = int * int * int * int * int;;

let string_of_epreuve e =
  match e with
    | Course -> "Course"
    | Tir -> "Tir"
    | Equitation -> "Equitation"
    | Natation -> "Natation"
    | Escrime -> "Escrime"
;;

let points_epreuve e j = 
  Printf.printf "Combien de points le joueur %d a-t-il eu pour l'épreuve de %s?\n" j (string_of_epreuve e);
  let pts = read_int (); in
  pts
;;

let new_competition e j =
  let rec get_points epvs jr pts =
    match epvs with
      | [] -> pts
      | hd::tl -> get_points tl j (pts@[Pair(hd, (points_epreuve hd jr))])
  in
  get_points e j []
;;

let new_joueur num e =
  let rec set_score epvs score =
    match epvs with
      | [] -> score
      | hd::tl -> set_score epvs (score@[Pair(hd, 0)])
  in
  let scores = set_score e [] in
  {id = num; competition = scores}
;;

let new_ponderation () =
  Printf.printf "Quel est la ponderation de la course?\n";
  let course = read_int (); in
  Printf.printf "Quel est la ponderation du tir?\n";
  let tir = read_int (); in
  Printf.printf "Quel est la ponderation de l'équitation?\n";
  let equitation = read_int (); in
  Printf.printf "Quel est la ponderation de la natation?\n";
  let natation = read_int (); in
  Printf.printf "Quel est la ponderation de l'escrime?\n";
  let escrime = read_int (); in
  (course, tir, equitation, natation, escrime)
;;

let score_pondere (ep_sc: epreuve_score) pnd =
  let (ep, sc) =
    match ep_sc with
      | Pair(e, s) -> (e, s)
  in
  let pds = match ep with
    | Course -> 
      let (res, _, _, _, _) = pnd in
      res
    | Tir ->
      let (_, res, _, _, _) = pnd in
      res
    | Equitation ->
      let (_, _, res, _, _) = pnd in
      res
    | Natation ->
      let (_, _, _, res, _) = pnd in
      res
    | Escrime ->
      let (_, _, _, _, res) = pnd in
      res
  in
  (sc * pds)
;;

let point_comp ep_scs pnd =
  let rec get_score ep_scs pnd score =
    match ep_scs with
      | [] -> score
      | hd::tl -> get_score tl pnd (score + (score_pondere hd pnd))
  in
  get_score ep_scs pnd 0
;;


let match_2 j1 j2 pnd =
  let s1 = point_comp j1.competition pnd in
  let s2 = point_comp j2.competition pnd in
  if s1 > s2 then
    Printf.printf "%d - %d\n" j1.id s1
  else
    if s2 > s1 then
      Printf.printf "%d - %d\n" j2.id s2
    else
      Printf.printf "Les 2 joueurs sont a égalité - %d" s1
;;

let resultat_partiel ep_sc pnd max =
  if max = 0 then
    point_comp ep_sc pnd
  else
    let rec get_score ep_sc pnd score max =
      if max = 0 then
        score
      else
        match ep_sc with
          | [] -> score
          | hd::tl -> get_score tl pnd (score + (score_pondere hd pnd)) (max - 1)
    in
    get_score ep_sc pnd 0 max
;;

let tournoi_a_4 eps =
  let pnd = new_ponderation (); in
  let c1 = new_competition eps 1 in
  let c2 = new_competition eps 2 in
  let c3 = new_competition eps 3 in
  let c4 = new_competition eps 4 in
  let j1 = {id = 1; competition = c1} in
  let j2 = {id = 2; competition = c2} in
  let j3 = {id = 3; competition = c3} in
  let j4 = {id = 4; competition = c4} in
  let win1 =
    let sc1 = resultat_partiel j1.competition pnd 2 in
    let sc2 = resultat_partiel j2.competition pnd 2 in
    if sc1 > sc2 then
      j1
    else
      j2
  in
  let win2 =
    let sc1 = resultat_partiel j3.competition pnd 2 in
    let sc2 = resultat_partiel j4.competition pnd 2 in
    if sc1 > sc2 then
      j3
    else
      j4
  in
  match_2 win1 win2
;;

