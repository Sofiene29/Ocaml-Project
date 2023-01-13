open Graph

(*JOB = i*10000+99*)
type idJob = int 
(*APPLICANT = i*10000+11*)
type idApp = int
type intrested = int


(*matrix applicant*job -> m[a,j] == a interested or not in j *)
type jobAppli= intrested list list 

val build_matrix : 'a * ('b * string list) list -> int list list

(*Read Matrix : Which applicant wants which jobs*)
val read_jobapp : 'a list * ('b * string list) list -> ('b * 'a list) list

(*takes the Applicants matrix and generates the Applicant nodes*)
val generate_apps: jobAppli -> 'b Graph.graph

(*takes the Applicants matrix and the graph with the applicants nodes and generates the Job nodes*)
val generate_jobs: jobAppli -> 'b Graph.graph -> 'b Graph.graph 

(*takes the applicant, the jobs he's/she's intrested in and generates corresponding arcs *)
val app_to_job: intrested list -> Graph.id -> int Graph.graph -> int Graph.graph

(*takes the matrix , and generates corresponding job-app arcs *)
val to_graph: jobAppli -> int Graph.graph -> int Graph.graph

(*add puit, source to graph*) 
val to_graph_capa: int Graph.graph -> Graph.id -> Graph.id -> int Graph.graph 

(*Analyzes ford fulkerson graph in order to associate each applicant to his job*)
val affectation: 'a Graph.graph -> (Graph.id * Graph.id) list

(*Demonstrate Affectation*)
val demo_affectation :(int * int) list -> 'a list * 'b list -> ('b * 'a) list

(*get applicants*)
val get_apps : ('a * 'b) list -> 'a list