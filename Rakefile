desc "Parse haml layouts"
task :haml_layout do
  print "Parsing Haml layouts..."
  system(%{
    cd _layouts/ && 
    for f in *.haml; do [ -e $f ] && haml $f ${f%.haml}.html; done
  })
  puts "done."
end

desc "Deploy the site!"
task :deploy do
  if system(%{jekyll build >/dev/null 2>&1})
    print "Successfully built site\n"
  else
    print "Failed building site\n"
    exit
  end

  sha_hash = `git log -n 1 --pretty=oneline`.slice(/\S+/)

  tempfile = "~/TEMP#{sha_hash}"

  if system("mkdir #{tempfile} >/dev/null 2>&1")
    print "Sucessfully made tempfile\n"
  else
    print "Cannot make tempfile\n"
    exit
  end
  `cp -r _site/* #{tempfile}`

  print "Remove contents of master\n"
  if !system(%{git checkout master >/dev/null 2>&1})
    print "Cannot checkout to master\n"
    `rm -r #{tempfile}`
    exit
  elsif !system(%{rm -r *})
    print "Cannot remove contents of master\n"
    `rm -r #{tempfile}`
    exit
  elsif !system(%{git rm -r --cached * >/dev/null 2>&1})
    print "Cannot remove cached contents\n"
    `rm -r #{tempfile}`
    exit
  end

  if system(%{cp -r #{tempfile}/* .})
    print "Copied over contents from temp\n"
  else
    print "Cannot copy over contents from temp\n"
    `rm -r #{tempfile}`
    exit
  end

  message = "Updated built site from develop - #{sha_hash}"
  `git add .`
  if system(%{git commit -m "#{message}" >/dev/null 2>&1})
    print "Commited!\n"
  else
    print "Cannot commit the site"
    `rm -r #{tempfile}`
    exit
  end

  if system(%{git push origin master >/dev/null 2>&1})
    print "Pushed site!\n"
  else
    print "Cannot push site"
    `rm -r #{tempfile}`
    exit
  end
  `git checkout develop >/dev/null 2>&1`

  `rm -r #{tempfile}`
end

