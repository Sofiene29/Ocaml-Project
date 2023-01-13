open Graph

(*JOB = i*10000+99*)
type idJob = int 
(*APPLICANT = i*10000+11*)
type idApp = int

type intrested = int

(*matrix applicant*job -> m[a,j] == a interested or not in j *)
type jobAppli= intrested list list 

(*Get the job given its id*)
let get_job_by_id id jobs = List.nth (List. rev jobs) ((id/10000)-1)

(*Get the job given its position*)
let get_job_by_pos id jobs = List.nth (List. rev jobs) id

(*Get the applicant's name given its id*)
let get_app_by_id id apps = List.nth apps ((id/10000)-1)


(*builds matrix*)
let build_matrix (jobs,apps) = 
  let rec loop acu = function
    | [] -> acu
    | (_,intrested)::xs -> loop ((List.map (fun x-> int_of_string x) intrested)::acu) xs
  in loop [] apps

(*Read Matrix : Which applicant wants which jobs*)

let read_interest (a,interested) all_jobs =
  let rec loop acu cmp = function
    | [] -> acu
    | j::js -> if (j="1") then loop ((get_job_by_pos cmp all_jobs ) ::acu)  (cmp+1) js else loop acu (cmp+1) js
  in (a,loop [] 0 interested)  

let read_jobapp (jobs,apps) = 
  let rec loop acu = function 
   | [] -> acu 
   | a::xs -> loop ((read_interest a jobs)::acu) xs
  in loop [] apps


(*takes the Applicants matrix and generates the Applicant nodes*)
let generate_apps ma =
  let rec loop n i acu = match n with 
    | 0 -> acu
    | x -> loop (n-1) (i+1) (new_node acu (i*10000+11))
  in loop (List.length ma) 1 empty_graph

(*takes the Applicants matrix and the graph with the applicants nodes and generates the Job nodes*)
let generate_jobs ma gr=
  let rec loop n i acu = match n with 
    | 0 -> acu
    | x -> loop (n-1) (i+1) (new_node acu (i*10000+99))
  in loop (List.length (List.nth ma 0)) 1 gr 

(*takes the applicant, the jobs he's/she's intrested in and generates corresponding arcs *)
let app_to_job jobs idApp gr =
  let rec loop j i aux =  match j with
    | []    -> aux
    | x::xs -> 
      if (x=1) then 
        loop xs (i+10000) (new_arc aux idApp i 1) 
      else
        loop xs (i+10000) aux
  in loop jobs 10099 gr

(*takes the matrix , and generates corresponding job-app arcs *)
let to_graph ma gr = 
  let rec loop m i aux = match m with
    | []    -> aux 
    | j::js -> loop js (i+10000) (app_to_job j i aux)
  in loop ma 10011 gr

(*add puit, source to graph*) 
let create_source gr s = new_node gr s 
let create_puit gr p = new_node gr p 

let to_graph_capa gr s p = n_fold gr (fun acu n -> if ((n mod 10000 )= 11) then new_arc acu s n 1 else  new_arc acu n p 1) (create_puit (create_source gr s) p)

(*Analyzes ford fulkerson graph in order to associate each applicant to his job*)
let affectation gr_max = e_fold gr_max (fun acu job app a-> if((job mod 10000=99)&&(app mod 10000=11)) then (app,job)::acu else acu) []
  

(*Demonstrate Affectation*)
let demo_affectation affectations (jobs,apps) = List.map (fun (app,job) -> ( get_app_by_id app apps,get_job_by_id job jobs) ) affectations

(*get applicants*)
let get_apps apps = 
  let rec loop acu = function
    |  [] -> acu
    | (x,_)::xs -> loop (x::acu) xs
  in loop [] apps  
