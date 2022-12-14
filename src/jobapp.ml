open Graph

(*JOB = i*10000+99*)
type idJob = int 
(*APPLICANT = i*10000+11*)
type idApp = int
type intrested = int

(*matrix applicant*job -> m[a,j] == a interested or not in j *)
type jobAppli= intrested list list 

(*takes the Applicants matrix and generates the Applicant nodes*)
let generate_apps ma =
  let rec loop n i acu = match n with 
    | 0 -> acu
    | x -> loop (n-1) (i+1) (new_node acu (i*10000+11))
  in loop (List.length ma) 0 empty_graph

(*takes the Applicants matrix and the graph with the applicants nodes and generates the jobs nodes*)
let generate_jobs ma gr=
  let rec loop n i acu = match n with 
    | 0 -> acu
    | x -> loop (n-1) (i+1) (new_node acu (i*10000+99))
  in loop (List.length (List.nth ma 0)) 0 gr 

(*takes the applicant, the jobs its intrested in and generates corresponding arcs *)
let app_to_job jobs idApp gr =
  let rec loop j i aux =  match j with
    | []    -> aux
    | x::xs -> 
      if (x=1) then 
        loop xs (i+10000) (new_arc aux idApp i 1) 
      else
        loop xs (i+10000) aux
  in loop jobs 1000099 gr

(*takes the matrix , and generates corresponding job-app arcs *)
let to_graph ma gr = 
  let rec loop m i aux = match m with
    | []    -> aux 
    | j::js -> loop js (i+10000) (app_to_job j i aux)
  in loop ma 1000011 gr

  (*add puit, source to graph*)
let to_graph_capa gr s p = n_fold gr (fun acu n -> if ((n mod 10000 )= 11) then new_arc acu s n 1 else  new_arc acu n p 1) gr

