#! /usr/bin/env ruby

require 'fssm'
require 'choice'

version = "1.0"
this_folder = Dir.pwd #File.dirname(__FILE__)

$choices = Choice.options do
  header 'CoffeeBlender options:'

  separator 'Required:'

  option :compile, :required => true do
    short '-c'
    long '--compile=src/'
    desc 'Folder containing the *.coffee source files.'
  end

  option :join, :required => true do
    short '-j'
    long '--join=script.js'
    desc 'Output file.'
  end

  separator 'Common:'

  option :help do
    short '-h'
    long '--help'
    desc 'Show this message.'
  end

  option :version do
    short '-v'
    long '--version'
    desc 'Show version.'
    action do
      puts "CoffeeBlender v#{version}"
      exit
    end
  end
end

# Compile changes with the coffee command line util
def compile
  puts `coffee -w --join #{$choices.join} --compile #{$choices.compile}/*.coffee`
end
# Compile directly after running the command
compile

# Do something after a change
def act(base, relative)
  compile unless relative == $choices.join
end

# Setup FSSM to watch the current folder
FSSM.monitor do
  path this_folder do
    update { |b,r| act(b,r) }
    delete { |b,r| act(b,r) }
    create { |b,r| act(b,r) }
  end
  puts "Watching #{$choices.compile} for changes and outputting to #{$choices.join}:"
end
