# Yorklyn

Writing is fun, but it's pretty hard to share your ideas without a blog, and in order to do that you have to use HTML.

The problem is you can't just copy and paste your writing into an HTML file and add some boilerplate. 
Instead, you have to manually go through each line and add <br> at the end of it, otherwise your writing will be formatted quite weirdly.

Yorklyn takes a plain text file, wraps it in HTML boilerplate, adds a blank stylesheet link -- `<link rel="stylesheet" href="">` -- and adds `<br>` to the end of your lines.

All you have to do is change the header and optionally link a stylesheet.

# Embedded Yorklyn

You can also embed Yorklyn in HTML. This is for the cases where you still need some of the features of HTML like buttons and links. To do so, just wrap your text in <yorklyn></yorklyn> and you won't have to write any `<br>` tags.

To transpile an HTML file that uses embedded yorklyn, use the embedded_yorklyn.pl script like so: `perl embedded_yorklyn.pl <your_file> <new_file>`.

# Use Yorklyn

In order to use Yorklyn, install it on your machine with git clone and optionally add it to your path so it's globally available. Then, the one line command is: 
`ocaml yorklyn.ml <your_text_file> <name_of_html_file>`

Naturally, you also need to have OCaml installed. You can find instructions on that [here](https://ocaml.org/install#linux_mac_bsd).

Cheers, and happy writing!
