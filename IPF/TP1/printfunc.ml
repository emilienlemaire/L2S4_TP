module PrintFunc = 
struct
  let affiche_string s = 
    Printf.printf "%s\n" s
  ;;

  let affiche_int i =
    Printf.printf "%d\n" i
  ;;

  let affiche_float f = 
    Printf.printf "%f\n" f
  ;;
end

let () = PrintFunc.affiche_string "Hello world !"

let () = PrintFunc.affiche_int 1000

let () = PrintFunc.affiche_float 12.2