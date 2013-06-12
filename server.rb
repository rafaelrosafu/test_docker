require 'rubygems'
require 'sinatra'

set :bind, '0.0.0.0'

get '/' do
  'hello world from a container'
end
