#!/usr/bin/env ruby

%w( rubygems haml dm-core dm-serializer dm-timestamps sinatra ).each { |lib| require lib }

class Member
  include DataMapper::Resource
  property :id, Serial
  property :name, String
end

configure :development do
  set :mode, 'development'
  DataMapper.setup(:default, :adapter => 'sqlite3', :database => 'db/development.sqlite3')
  DataMapper.auto_migrate!
end

configure :production do
  set :mode, 'production'
  DataMapper.setup(:default, :adapter => 'sqlite3', :database => 'db/development.sqlite3')
end

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
  Member.create :name => params[:name]
  redirect "/#{params[:name]}"
end

get '/demo.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :demo
end

get '/about' do
  erb %{<html><head><title>About</title></head><body>Sinatra #{Sinatra::VERSION} is running in #{options.mode} mode.</body></html>}
end

get '/:evil' do
  pass unless params[:evil] =~ /evil/i
  status 404
  haml :not_found
end

get '/:name' do
  haml :hello_name, :locals => { :name => params[:name], :historical_names => Member.all.map { |m| m.name } }
end

