(* Yes, we have to repeat open Graph. *)
open Graph

(* assert false is of type ∀α.α, so the type-checker is happy. *) 
(*returns a new graph having the same nodes than gr, but no arc.*)
let clone_nodes gr = n_fold gr (fun acu id-> new_node acu id) empty_graph 

(*maps all arcs of gr by function f*)
let gmap gr f =  e_fold gr (fun acu id1 id2 a-> new_arc acu id1 id2 (f a))  (clone_nodes gr)

(*adds n to the value of the arc between id1 and id2. If the arc does not exist, it is created*)
let add_arc gr id1 id2 n =  match (find_arc gr id1 id2 ) with 
  |None -> new_arc gr id1 id2 n 
  |Some a -> new_arc gr id1 id2 (n+a)