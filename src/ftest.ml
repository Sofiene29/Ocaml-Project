open Gfile
open Jfile
open Tools
open Fulkerson
open Jobapp 


(************************************************)
(************************************************)
(************************************************)
(*USEFUL FUNCTIONS FOR PRINTING TESTS*)


(* PRINT TUPLE of : (applicant_name * [ list of jobs he/she wants ]) *)
let rec print_tuples2 =
  function
  | [] -> ()
  | (a, b) :: rest ->
    Printf.printf " \n App :  %s     Wants jobs : " a ; List.iter (Printf.printf "%s ") b ;
    print_tuples2 rest

(* PRINT TUPLE of : (applicant_name * Job Assigned to him/her ) *)
let rec print_tuples3 =
  function
  | [] -> ()
  | (a, b) :: rest ->
    Printf.printf "Applicant : %s || Assigned job : %s; \n" a b;
    print_tuples3 rest

(*PRINT : INPUT FILE*)
let rec print_input_file (j,a)= List.iter (Printf.printf "%s  -  ") j ; print_tuples2 a



(************************************************)
(************************************************)
(************************************************)
(*TEST STARTS HERE*)


let () =
  (* Check the number of command-line arguments *)
  if Array.length Sys.argv <> 3 then
    begin
      Printf.printf "\nUsage: %s infile source sink outfile\n\n%!" Sys.argv.(0) ;
      exit 0
    end ;

  (* Arguments are : infile(1) outfile(2) *)

  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(2)

  in

  (*READ INPUT FILE*)
  let input = Jfile.from_file infile in 

  let () = Printf.printf "\n________________________________\n" in
  let () = Printf.printf "**READ INPUT**\n________________________________\n\n" in
  let l = read_jobapp input in
  let () = print_tuples2 l in
  let () = Printf.printf "\n________________________________\n" in
  let () = Printf.printf "\n\n" in


  (*DATA PROCESSING*)
  let matrix0 = build_matrix input in

  let g = generate_apps matrix0 in 
  
  let g=generate_jobs matrix0 g in

  let g= to_graph matrix0 g in
  
  let g= to_graph_capa g 50 05 in 

  let g=fulkerson g 50 05 in

  let res=affectation g in 


  (*TEST AFFECTATION*)
  let res = demo_affectation res (fst input, get_apps (snd input) ) in

  let () = Printf.printf "\n________________________________\n" in
  let () = Printf.printf "**READ OUTPUT**\n________________________________\n" in
  let () = print_tuples3 res in
  let () = Printf.printf "\n________________________________\n" in
  let () = Printf.printf "\n\n" in

  (*FOLLOW UP GRAPH*)
  let g = gmap g (fun x-> string_of_int x) in


  (* Rewrite the graph that has been read. *)
  let () = write_file outfile g in
  let()=export "/home/benyahia/4 IR/ProjectOCaml/ocaml-maxflow-project/jobapptest/outfile.dot" g in  
  ()



(************************************************)
(************************************************)