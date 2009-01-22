require 'sinatra'
require 'sinatra/test/rspec'
require 'demo'

describe 'Demo application' do
  it 'should have a default page' do
    get '/'
    @response.should be_ok
  end
end
