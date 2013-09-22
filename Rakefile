desc "Parse haml layouts"
task :haml_layout do
  print "Parsing Haml layouts..."
  system(%{
    cd _layouts/ && 
    for f in *.haml; do [ -e $f ] && haml $f ${f%.haml}.html; done
  })
  puts "done."
end
