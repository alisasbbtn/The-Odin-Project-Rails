require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(0..100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message }
end

def check_guess(guess)
  if (guess - SECRET_NUMBER) > 5
    return "Way too high!"
  elsif (SECRET_NUMBER - guess) > 5
    return "Way too low"
  elsif guess > SECRET_NUMBER
    return "Too high!"
  elsif guess < SECRET_NUMBER
    return "Too low!"
  elsif guess < SECRET_NUMBER
    return "Too low!"
  elsif guess == SECRET_NUMBER
    return "Correct!"
  end
end
