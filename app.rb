require 'bundler'
Bundler.require #to bring in all dependencies of gems

require_relative 'models/friend' #GET request to /friends

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'phonebook_app'
  )

get '/' do
  redirect '/friends'
end

get '/friends' do
  @friends = Friend.all
  erb :index
end

#new
get '/friends/new' do
  erb :new
end

#create
post '/friends' do
  name = params['friend_name']
  state = params['friend_state']
  contact = params['friend_contact']
  Friend.create({:name => name, :state => state, :contact => contact})
  redirect '/friends'
end

#show
get '/friends/:id' do
  @friend = Friend.find(params[:id])
  erb :show
end

#edit
get '/friends/:id/edit' do
  @friend = Friend.find(params[:id])
  erb :edit
end

#update
put '/movies/:id' do
  friend = Friend.find(params[:id])
  friend.name = params['friend_name']
  friend.state = params['friend_state']
  friend.contact = params['friend_contact']
  friend.save
  redirect_to '/friends/#{friend.id}'
end

#delete
delete '/friends/:id' do
  Friend.delete(params[:id])
  redirect '/friends'
end
