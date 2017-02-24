require 'sinatra'
require 'sinatra/reloader'

require_relative 'dict'

enable :sessions
set :session_secret, 'mumbojumbo'

DICTIONARY = Dictionary.new

get '/' do
  new_game if show.nil?
  show
  erb :index
end

get '/new' do
  session.clear
  new_game
  redirect '/'
end

get '/guess' do
  if params[:guess] != ''
    session[:message] = check_guess(params[:guess].downcase)
    redirect to '/end' if win? || lose?
  end

  redirect to '/'
end

get '/end' do
  redirect '/' if session.nil?
  @message = win? ? "Wow, you guessed it! The word was #{session[:word]}! You win!" : "Aww, man! The word was \"#{session[:word]}\"! You lose!"
  session.clear
  erb :message
end

helpers do
  def show
    return nil if session.nil?

    @message = session[:message]
    @chances = session[:chances]
    @word_show = session[:word_show]
    @message = session[:message]
    @word = session[:word]
    @guesses = session[:guesses]
  end

  def new_game
    session[:word] = DICTIONARY.random_word
    session[:word_show] = '_' * session[:word].size
    session[:chances] = 6
    session[:guesses] = Array.new
    session[:message] = 'Generated new super-hard word for you!'
  end

  def check_guess(guess)
    if used?(guess)
      return "You've already used it!"
    else
      session[:guesses] << guess
      if session[:word].include? (guess)
        show_guess(guess)
        return "Keep it up!"
      else
        session[:chances] -= 1
        return "What a shame..."
      end
    end
  end

  def used?(guess)
    session[:guesses].index(guess).nil? ? false : true
  end

  def show_guess(guess)
    session[:word].split('').each_index { |index| session[:word_show][index] = guess if session[:word][index] == guess}
  end

  def win?
    session[:word] == session[:word_show] ? true : false
  end

  def lose?
    session[:chances].zero? ? true : false
  end
end

