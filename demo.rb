#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

template :layout do
  %{!!! XML
!!! Strict
%html
  %head
    %title Sinatra
  %body
    = yield
}
end

template :index do
  '%p Hello world!'
end

get '/' do
  haml :index
end
