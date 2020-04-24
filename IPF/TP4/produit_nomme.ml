type name = {nom: string; prenom: string};;
type anniv = {jour: int; mois: int; annee: int};;
type personne = {name: name; anniv: anniv};;

let print_name n =
  Printf.printf "%s %s\n" n.prenom n.nom
;;

let print_anniv a =
  if a.mois < 10 then
    Printf.printf "%d/0%d/%d\n" a.jour a.mois a.annee
  else
    Printf.printf "%d/%d/%d\n" a.jour a.mois a.annee

;;

let print_person p =
  print_name p.name;
  print_anniv p.anniv;
;;

let p = {
  name = {nom = "Lemaire"; prenom = "Emilien"};
  anniv = {jour = 23; mois = 01; annee = 1998}
};;

let test = print_person p;;