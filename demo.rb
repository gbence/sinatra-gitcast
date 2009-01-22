#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

get '/' do
  haml '%p Hello world!'
end
