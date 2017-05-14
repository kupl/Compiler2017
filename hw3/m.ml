(**************************)
(*    syntax              *)
(**************************)
type inst = 
  | Push of int 
  | Add
  | Mul
  | Sub
  | True
  | False
  | Eq
  | Le
  | And
  | Neg
  | Fetch of var
  | Store of var 
  | Noop
  | Branch of cmd * cmd
  | Loop of cmd * cmd
  | Read
  | Print

and cmd = inst list
and var = string

(**************************)
(*    pretty printer      *)
(**************************)
let rec i2s inst =
  match inst with
  | Push n -> "push("^string_of_int n^")"
  | Add -> "add"
  | Mul -> "mul"
  | Sub -> "sub"
  | True -> "true"
  | False -> "false"
  | Eq -> "eq"
  | Le -> "le"
  | And -> "and"
  | Neg -> "neg"
  | Fetch x -> "fetch("^x^")"
  | Store x -> "store("^x^")"
  | Noop -> "noop"
  | Branch (c1,c2) -> "branch("^c2s c1^","^c2s c2^")"
  | Loop (c1,c2) -> "loop("^c2s c1^","^c2s c2^")"
  | Read -> "read"
  | Print -> "print"
and c2s cmd = List.fold_left (fun s i -> s ^ " " ^ i2s i) "" cmd
let pp cmd = print_endline (c2s cmd)

(**************************)
(*    semantics           *)
(**************************)
type value = Z of int | T of bool
type stack = value list
type state = (var, int) PMap.t

let state_empty = PMap.empty
let state_lookup x s = PMap.find x s
let state_bind x v s = PMap.add x v s

let next : inst list * stack * state -> inst list * stack * state
=fun (c,e,s) -> ([],e,s) (* TODO *)

let run : cmd -> state
=fun c -> 
  let iconf = (c, [], state_empty) in
  let rec iter (c,e,s) = 
    match next (c,e,s) with
    | [], _, s  -> s
    | c', e',s' -> iter (c',e',s') in
    iter iconf
