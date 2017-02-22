require 'sinatra'
require 'sinatra/reloader' if development?

set :port, 3000 if development?

get '/' do
  action = params["action"]

  case action
    when "Encode"
      result_text = caesar_cipher(params["text"], params["shift"].to_i)
    when "Decode"
      result_text = caesar_cipher(params["text"], 26 - params["shift"].to_i)
    when "Clear"
      params["text"] = params["shift"] = nil
      result_text = ''
    else
      result_text = ''
  end

  erb :index, :locals => {:text => params["text"], :shift => params["shift"], :result_text => result_text }

end


def caesar_cipher (text, shift)
  #return nil if text.nil? && shift.nil?

  result = ''
  text.split('').each { |symbol|
    if /[a-z]|[A-Z]/ === symbol
      char = (symbol == symbol.upcase ? 'A' : 'a')
      result += ((((symbol.ord + shift) - char.ord) % 26) + char.ord).chr
    else
      result += symbol
    end
  }
  result
end
