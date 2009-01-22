#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

get '/' do
  haml :query
end

post '/' do
  redirect "/#{params[:name]}"
end

get '/demo.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :demo
end

get '/:evil' do
  pass unless params[:evil] =~ /evil/i
  status 404
  "404 - Not found"
end

get '/:name' do
  haml :hello_name, :locals => { :name => params[:name] }
end
