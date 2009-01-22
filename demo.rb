#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

get '/' do
  haml :index, :locals => { :name => 'world' }
end

get '/:name' do
  haml :index, :locals => { :name => params[:name] }
end
