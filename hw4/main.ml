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
      let s_pgm = Parser.program Lexer.start lexbuf in
      let _ = print_endline "== source program ==";
              S.pp s_pgm in
      let _ = print_endline "== execute the source program ==";
              (try S.execute s_pgm;
              with (Failure s) -> print_endline ("Error: "^s)) in
      let t_pgm = Translator.translate s_pgm in
      let _ = print_endline "== translated target program ==";
              T.pp  t_pgm in
      let _ = print_endline "== execute the translated program ==";
              (try T.execute t_pgm
              with (Failure s) -> print_endline ("Error: "^s)) in
      let t_pgm_opt = Optimizer.optimize t_pgm in
      let _ = print_endline "== optimized target program ==";
              T.pp t_pgm_opt in
      let _ = print_endline "== execute the optimized target program ==";
              (try T.execute t_pgm_opt
               with (Failure s) -> print_endline ("Error: "^s)) in
        ()
    with (Failure s) -> print_endline (!src ^ ": " ^ s)

let _ = main ()
