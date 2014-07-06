require 'bundler'
Bundler.require #to bring in all dependencies of gems

require relative 'models/friend' #GET request to /friends

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'phonebook_app'
  )

get '/' do
  erb :index
end

