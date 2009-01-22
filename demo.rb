#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

get '/' do
  haml :index, :locals => { :name => 'world' }
end

get '/demo.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :demo
end

get '/:name' do
  haml :index, :locals => { :name => params[:name] }
end
