open Graph 
open Tools

val init_graph_ecart : int graph -> int graph
val calc_graph_ecart : int Graph.graph -> Graph.id list -> int -> int Graph.graph
val find_path : 'a Graph.graph -> Graph.id -> Graph.id -> Graph.id list option
val delete_zero :int Graph.graph -> int Graph.graph
val get_min_flot : int Graph.graph -> Graph.id list -> int -> int

val fulkerson : int Graph.graph -> Graph.id -> Graph.id -> int Graph.graph