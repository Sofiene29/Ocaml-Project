open Gfile
open Tools
open Fulkerson
open Jobapp 

let rec print_tuples =
  function
  | [] -> ()
  | (a, b) :: rest ->
    Printf.printf " \n applicant: %d assigned job: %d; \n " (a/10000) (b/10000);
    print_tuples rest


let () =
  (* Check the number of command-line arguments *)
  if Array.length Sys.argv <> 5 then
    begin
      Printf.printf "\nUsage: %s infile source sink outfile\n\n%!" Sys.argv.(0) ;
      exit 0
    end ;



  (* Arguments are : infile(1) source-id(2) sink-id(3) outfile(4) *)

  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(4)

  (* These command-line arguments are not used for the moment. *)
  and _source = int_of_string Sys.argv.(2)
  and _sink = int_of_string Sys.argv.(3)
  in


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

  