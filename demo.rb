#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

get '/' do
  haml :index
end
