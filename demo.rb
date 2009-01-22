#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

get '/' do
  redirect "/#{params[:name]}" if params[:name]
  haml :query
end

get '/demo.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :demo
end

get '/:name' do
  haml :hello_name, :locals => { :name => params[:name] }
end
