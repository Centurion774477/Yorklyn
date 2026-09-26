

let read_file file =
  match In_channel.with_open_text file In_channel.input_all with
  | contents -> contents
  | exception Sys_error message ->
    Printf.printf "An error occured %s\n" message;
    exit 1

let write_out file data =
  match Out_channel.with_open_gen [Open_append; Open_creat; Open_text] 0o644 file (fun channel ->
    Out_channel.output_string channel data) with
  | () -> ()
  | exception Sys_error message ->
    Printf.printf "An error occured %s\n" message;
    exit 1

let add_opening_boilerplate file_out =
  write_out file_out "
<!DOCTYPE html>
<html lang=\"en\">
<head>
  <meta charset=\"UTF-8\">
  <title>Your Title Here</title>

  <link rel=\"stylesheet\" href=\"your_stylesheet_here\">
</head>
<body>

<h1>Your header here</h1>

<p>

  "

let add_closing_boilerplate file_out =
  write_out file_out "
</p>
</body>
</html>
  "

let transform_contents contents =
  String.split_on_char '\n' contents
  |> String.concat "<br>\n"

let () =
    if Array.length Sys.argv < 3 then begin
      Printf.printf "Please call the script with these arguments: <file_to_read> <file_to_create>\n";
      exit 1
    end;

    let fileToRead = Sys.argv.(1) in
    let fileToCreate = Sys.argv.(2) in

    let contents = read_file fileToRead in
    let transformed_contents = transform_contents contents in
    add_opening_boilerplate fileToCreate;
    write_out fileToCreate transformed_contents;
    add_closing_boilerplate fileToCreate
    