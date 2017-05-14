open While
open M

let main () =
    let print_code = ref false in
    let src = ref "" in
    let spec = [("-pp", Arg.Set print_code, "pretty print the input program")] in
    let usage = "Usage: run <options> <file>" in
    let _ = Arg.parse spec
                (fun
                   x ->
                     if Sys.file_exists x then src := x
                     else raise (Arg.Bad (x ^ ": No files given")))
                usage
    in

  if !src = "" then Arg.usage spec usage
    else
    try
      let file_channel = open_in !src in
      let lexbuf = Lexing.from_channel file_channel in
      let pgm = Parser.program Lexer.start lexbuf in
      let _ = print_endline "== source program ==";
              While.pp pgm in
      let _ = print_endline "== execute the source program ==";
              (try While.run pgm;
              with (Failure s) -> print_endline ("Error: "^s)) in
      let t_pgm = Translation.trans pgm in
      let _ = print_endline "== target program ==";
              M.pp t_pgm in
      let _ = print_endline "== execute the target program ==";
              (try ignore (M.run t_pgm) 
              with (Failure s) -> print_endline ("Error: "^s)) in
       ()
    with _ -> print_endline (!src ^ ": Error")

let _ = main ()
