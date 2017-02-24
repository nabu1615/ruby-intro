text = ARGV[ARGV.index("--phrase") + 1]

File.open("soy_nuevo.md", "a+") {|file| file.puts(text)}

