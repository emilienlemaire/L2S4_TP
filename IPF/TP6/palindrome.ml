let get_last l =
  let rev = List.rev l in
  match rev with
    | [] -> None
    | hd::tl -> Some hd
;;

let remove_last l = 
  let rev = List.rev l in
  match rev with
    | [] -> []
    | hd::tl -> (List.rev tl)
;;

let rec is_palindrome_1 l =
  match l with
  | [] -> true
  | hd::tl ->
    match tl with
      | [] -> true
      | _ -> 
        if Some hd = get_last tl then
          is_palindrome_1 (remove_last tl)
        else
          false
;;


Printf.printf "%B\n" (is_palindrome_1 ["de"; "la"; "sa"; "la"; "de"]);;
Printf.printf "%B\n" (is_palindrome_1 [1; 2; 3; 2; 3]);;

let get_remove_last l =
  let rev = List.rev l in
  match rev with
    | [] -> (None, [])
    | hd::tl -> ((Some hd), (List.rev tl))
;;

let rec is_palindrome_2 l =
  match l with
    | [] -> true
    | hd::tl ->
      match tl with
      | [] -> true
      | _ -> 
        let (last, rem) = get_remove_last tl in
          if Some hd = last then
            is_palindrome_2 rem
          else
            false
;;


Printf.printf "%B\n" (is_palindrome_2 ["de"; "la"; "sa"; "la"; "de"]);;
Printf.printf "%B\n" (is_palindrome_2 [1; 2; 3; 2; 3]);;

let rec list_equal l1 l2 =
  match (l1, l2) with
    | [], [] -> true
    | [], _ -> false
    | _, [] -> false
    | hd1::tl1, hd2::tl2 ->
      if hd1 = hd2 then
        list_equal tl1 tl2
      else
        false
;;

let is_palindrome_3 l =
  let rev = List.rev l in
  rev = l
;;


Printf.printf "%B\n" (is_palindrome_3 ["de"; "la"; "sa"; "la"; "de"]);;
Printf.printf "%B\n" (is_palindrome_3 [1; 2; 3; 2; 3]);;
