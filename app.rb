require 'bundler'
Bundler.require()

# Connection
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'to_do_app'
)

require './models/todo'


# Routes
get '/api/todos' do   # all todos
  content_type :json
  To_do.all.to_json
end


get '/api/todos/:id' do   # specific todo
  content_type :json
  todo = To_do.find(params[:id].to_i)
  todo.to_json
end


post '/api/todos' do   # create a new todo
  content_type :json
  todo = To_do.create(params[:todo])
  todo.to_json
end

###
put '/api/todos/:id' do   # update an existing todo
  content_type :json
  todo = To_do.find(params[:id].to_i).update(params[:todo])
  todo.to_json
end

###
patch '/api/todos/:id' do   # update an existing todo
  content_type :json
  todo = To_do.find(params[:id].to_i).update(params[:todo])
  todo.to_json
end


delete '/api/todos/:id' do  # delete an existing todo
  content_type :json
  id = params[:id].to_i
  todo = To_do.destroy(id)
end


# Model
