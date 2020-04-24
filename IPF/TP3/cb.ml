open Graphics;;
open Unix;;

let left = 0.
let right = 300.
let down = 0.
let up = 500.

let ball = 5
let ballf = float_of_int ball

let paddle = 50

let vx = (Random.float 0.25);;
let vy = (Random.float 1.) -. 1.;;

let draw_ball x y = 
  fill_circle (int_of_float x) (int_of_float y) ball;;
;;

let new_position_x x vx =
  x+.vx
;;

let new_position_y y vy =
  y+.vy
;;

let draw_paddle x =
  Graphics.fill_rect x (int_of_float down)  paddle 4
;;

let position_paddle () =
  let (x, y) = Graphics.mouse_pos () in
  x
;;


let bounce_x x vx =
  if x +. ballf >= 300. || x -.ballf <= 0. then (-.vx) else vx
;;

let bounce_y x y vy p =
  let paddlef = float_of_int paddle in
  if x +. ballf > (p -. paddlef) && x -.ballf < p +. paddlef && y -. ballf <= 4. then
    (-.vy)
  else
  if y +. ballf > 500. then
    (-.vy)
  else vy
;;

let rec game x y vx vy =
  Unix.sleepf (1. /. 1000.);
  Graphics.clear_graph ();
  draw_ball x y;
  let mouse = position_paddle () in
  draw_paddle mouse;
  Graphics.synchronize ();
  let key = if key_pressed () then read_key () else '+' in
  let new_x = new_position_x x vx in
  let new_y = new_position_y y vy in
  let new_vx = bounce_x new_x vx in
  let new_vy = bounce_y new_x new_y vy (float_of_int mouse) in
  if new_y > 0. && key <> 'q' then
    game new_x new_y new_vx new_vy
  else ()
;;

let dim = Printf.sprintf " %dx%d" (int_of_float(right)) (int_of_float (up));;

open_graph dim; Graphics.auto_synchronize false; game 150. 250. vx vy;;