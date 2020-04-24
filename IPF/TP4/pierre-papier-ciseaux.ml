type rps = Pierre | Papier | Ciseau;;
type jeu = Gagnant of rps | Nul;;

let qui_gagne (a,b) =
  match a with
    Pierre -> if b = Papier then Gagnant(b) else if b = Ciseau then Gagnant(a) else Nul
  | Papier -> if b = Ciseau then Gagnant(b) else if b = Pierre then Gagnant(a) else Nul
  | Ciseau -> if b = Pierre then Gagnant(b) else if b = Papier then Gagnant(a) else Nul
;;