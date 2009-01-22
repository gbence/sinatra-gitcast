#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

not_found do
  status 404
  haml :not_found
end

error do
  status 401
  haml :error, :locals => { :exception => env['sinatra.error'] }
end

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

get '/exception' do
  raise 'error'
end

get '/:evil' do
  pass unless params[:evil] =~ /evil/i
  status 404
  haml :not_found
end

get '/:name' do
  haml :hello_name, :locals => { :name => params[:name] }
end

