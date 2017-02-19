require 'sinatra'
require 'sinatra/reloader'

number = rand(0..100)
get '/' do
  "The SECRET NUMBER is #{number}"
end

