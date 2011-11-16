#! /bin/sh
if [ -s coffeeblender.rb ]; then
  bundle
  if ln -s $PWD/coffeeblender.rb /usr/bin/coffeeblender; then
    printf "Shortcut created, run coffeeblender from one of your projects\n"
  else
    printf "Do you have permission to write in /usr/bin? If not try running with 'sudo'.\n"
  fi
else
  printf "File 'coffeeblender.rb' does not exist\n"
fi
