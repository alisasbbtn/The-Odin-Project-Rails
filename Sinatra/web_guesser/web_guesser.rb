require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(0..100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  color = change_color(message)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :color => color }
end

def check_guess(guess)
  if (guess - SECRET_NUMBER).abs > 5
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

def change_color(message)
  if message.split()[0] == "Way"
    'darkred'
  elsif message.split()[0] == "Too"
    'indianred'
  else
    'green'
  end
end
