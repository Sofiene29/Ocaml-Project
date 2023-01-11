open Gfile
open Jfile
open Tools
open Fulkerson
open Jobapp 

let rec print_tuples =
  function
  | [] -> ()
  | (a, b) :: rest ->
    Printf.printf " \n applicant: %d assigned job: %d; \n " (a/10000) (b/10000);
    print_tuples rest

let rec print_tuples2 =
  function
  | [] -> ()
  | (a, b) :: rest ->
    Printf.printf " \n App :  %s wants jobs " a ; List.iter (Printf.printf "%s  -  ") b ;
    print_tuples2 rest



let rec print_input_file (j,a)= List.iter (Printf.printf "%s  -  ") j ; print_tuples2 a

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

  let input = Jfile.from_file infile in 
  let () = print_input_file input in

  let matrix1= [[1;1;1];[1;0;0];[0;1;0]] in

  let g = generate_apps matrix1 in 
  
  let g=generate_jobs matrix1 g in

  let g= to_graph matrix1 g in
  
  let g= to_graph_capa g 50 05 in 

  let g=fulkerson g 50 05 in

  let res=affectation g in 
  let () = print_tuples res in

  let g = gmap g (fun x-> string_of_int x) in



  (* Rewrite the graph that has been read. *)
  let () = write_file outfile g in
  let()=export "/home/benyahia/4 IR/ProjectOCaml/ocaml-maxflow-project/jobapptest/outfile.dot" g in  
  ()

  