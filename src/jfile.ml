open Printf
open Jobapp



(*liste des jobs [Ingénieur ....] E*)
let read_job listJob line =
  try Scanf.sscanf line "j %s" (fun name -> name::listJob)
  with e ->
    Printf.printf "Cannot read applicant in line - %s:\n%s\n%!" (Printexc.to_string e) line ;
    failwith "from_file"

(*liste des app [(Sophia , [job1, jobe2...]) ; (,) ...] *)
let read_app listApps line = 
  try Scanf.sscanf line "a %s %s" (fun name jobs -> (name, String.split_on_char '-' jobs)::listApps )
  with e ->
    Printf.printf "Cannot read applicant in line - %s:\n%s\n%!" (Printexc.to_string e) line ;
    failwith "from_file"


(* Reads a comment or fail. *)
let read_comment res line =
  try Scanf.sscanf line " %%" res
  with _ ->
    Printf.printf "Unknown line:\n%s\n%!" line ;
    failwith "from_file"



(*result = [ [Jobs] ; [Applicants] ; [[Applicnat wats which Job]]*)

let from_file path = 
  let infile = open_in path in

   (* Read all lines until end of file. *)
   let rec loop (jobs, applicants) =
    try
      let line = input_line infile in

      (* Remove leading and trailing spaces. *)
      let line = String.trim line in

      let res2 =
        (* Ignore empty lines *)
        if line = "" then (jobs ,applicants)

        (* The first character of a line determines its content : n or e. *)
        else match line.[0] with
          | 'a' -> (jobs,read_app applicants line)
          | 'j' -> (read_job jobs line,applicants)

          (* It should be a comment, otherwise we complain. *)
          | _ -> read_comment (jobs ,applicants) line
      in      
      loop res2

    with End_of_file -> (jobs ,applicants) (* Done *)
  in

  let final_result = loop ([],[]) in
  
  close_in infile ;
  final_result