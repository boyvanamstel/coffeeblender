# Overview

CoffeeBlender allows you to watch a folder for changes in multiple .coffee files and instantly compile it into a single .js file.

Basically running the following command after each change you make:

    coffee --join script.js --compile src/*.coffee

I know coffee allows you to --watch a folder, but it lacks support for the --join parameter. CoffeeBlender works around the issue :).

# Requirements

You need to have the [coffee command line utility](http://jashkenas.github.com/coffee-script/#installation) installed.

Additionaly you need some Ruby Gems. Just run bundler after cloning the repo:

    $ bundle

# Running it

First install the coffeeblender script into `/usr/bin` using the install script:

    $ ./install.sh

If it complains about permissions, prepend the command with `sudo`.

Afterwards it'll let you know everything has been setup. Change to your javascript folder, for instance: `$ cd /some/project/js` and run coffeeblender:

    $ coffeeblender -c src/ -j script.js

This assumes you have your .coffee files in a subdirectory called `src/`. Change it to match your setup, or run `coffeeblender -h` for all options.

CoffeeBlender should create a joined javascript file instantly and update it while you work :).
