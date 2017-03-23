require 'rest-client'

url = "http://localhost:3000/users"
puts RestClient.get(url)

url = "http://localhost:3000/users/new"
puts RestClient.get(url)

url = "http://localhost:3000/users/id/edit"
puts RestClient.get(url)

url = "http://localhost:3000/users/id"
puts RestClient.get(url)

url = "http://localhost:3000/users"
RestClient.post(url,"")
