require 'rubygems'
require 'bundler'

Bundler.require

require_relative 'demo_app/demo_app'
puts $CLASSPATH
run DemoApp
