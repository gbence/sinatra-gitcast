#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

template :index do
  '%p Hello world!'
end

get '/' do
  haml :index
end
