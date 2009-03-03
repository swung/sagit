#!/usr/bin/ruby

LIBDIR = File.join(File.expand_path(File.dirname(__FILE__)),'../lib')
CONFDIR = File.join(File.expand_path(File.dirname(__FILE__)),'../conf')
$:.unshift(LIBDIR)

require 'sagit'

Sagit.new(File.join(CONFDIR,'sagit.yml'))

Sagit::App.set :environment, ENV["RACK_ENV"] || :production
Sagit::App.set :port, 8307

run Sagit::App
