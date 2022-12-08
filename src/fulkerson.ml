open Graph  
open Tools

let init_graph_ecart gr = e_fold gr (fun acu id1 id2 a->add_arc acu id2 id1 0) gr

let rec calc_graph_ecart gr path incr= match path with 
  | [_] | [] -> gr
  | id1::id2 :: rest -> calc_graph_ecart (add_arc (add_arc gr id1 id2 (-incr) ) id2 id1 (incr)) (id2::rest) incr 

let delete_zero graph = e_fold graph (fun acu id1 id2 a-> if (a>0) then new_arc acu id1 id2 a else acu) (clone_nodes graph)


(* Renvoie un chemin (liste de noeud) ou None si pas de chemin*)

  let find_path gre origin destination =

    (*  Renvoie un chemin current->destination (liste de noeud) ou None si pas de chemin *)
    let rec aux current visited = 
      if current=destination then 
        Some [current]
      else 
         if (List.mem current visited ) then
           None
        else 
          match (List.find_map 
            ( fun (next,_) -> aux next (current :: visited) )
           (out_arcs gre current)) with
           | Some path ->Some (current::path)
           | None -> None
    in aux origin []
    

let rec get_min_flot graph path min= match path with 
| [_] | [] ->  min  
|id1::id2 :: rest -> match find_arc graph id1 id2 with 
                        |None-> 0  
                        | Some x -> if x<min then get_min_flot graph (id2::rest) x else   get_min_flot graph (id2::rest) min 


let fulkerson graph o d = 
  let rec loop gre =
    let gr_Z = delete_zero gre in 
    match find_path gr_Z o d with 
    | None -> gr_Z
    | Some p ->
        let m = get_min_flot gr_Z p Int.max_int in
        let gre_nv = calc_graph_ecart gr_Z p m in
        loop gre_nv
  in loop graph







  
  


