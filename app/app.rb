# Require the bundler gem and then call Bundler.require to load in all gems
# listed in Gemfile.
require 'bundler'
Bundler.require

# Setup DataMapper with a database URL. On Heroku, ENV['DATABASE_URL'] will be
# set, when working locally this line will fall back to using SQLite in the
# current directory.
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/development.sqlite")

# Define a simple DataMapper model.
class Space
  include DataMapper::Resource

  property :id, Serial, :key => true
  property :created_at, DateTime

  property :title, String, :length => 255
  property :description, Text
  property :address, Text
  property :phone, String
  property :owner, Text
  property :accessibility, Text
  property :url, String
  property :email, String
end

# Finalize the DataMapper models.
DataMapper.finalize

# Tell DataMapper to update the database according to the definitions above.
DataMapper.auto_upgrade!

get '/' do
  send_file './public/index.html'
end

# Route to show all spaces, ordered like a blog
get '/spaces' do
  content_type :json
  @spaces = Space.all(:order => :created_at.desc)

  @spaces.to_json
end

# CREATE: Route to create a new Thing
post '/spaces' do
  content_type :json

  # These next commented lines are for if you are using Backbone.js
  # JSON is sent in the body of the http request. We need to parse the body
  # from a string into JSON
  # params_json = JSON.parse(request.body.read)

  # If you are using jQuery's ajax functions, the data goes through in the
  # params.
  @space = Space.new(params)

  if @space.save
    @space.to_json
  else
    halt 500
  end
end

# READ: Route to show a specific Thing based on its `id`
get '/spaces/:id' do
  content_type :json
  @space = Space.get(params[:id])

  if @space
    @space.to_json
  else
    halt 404
  end
end

# UPDATE: Route to update a Thing
put '/spaces/:id' do
  content_type :json

  # These next commented lines are for if you are using Backbone.js
  # JSON is sent in the body of the http request. We need to parse the body
  # from a string into JSON
  # params_json = JSON.parse(request.body.read)

  # If you are using jQuery's ajax functions, the data goes through in the
  # params.

  @space = Space.get(params[:id])
  @space.update(params)

  if @space.save
    @space.to_json
  else
    halt 500
  end
end

# DELETE: Route to delete a Thing
delete '/spaces/:id/delete' do
  content_type :json
  @space = Space.get(params[:id])

  if @space.destroy
    {:success => "ok"}.to_json
  else
    halt 500
  end
end

# If there are no spaces in the database, add a few.
if Space.count == 0
  Space.create(:title => "Test Thing One", :description => "Sometimes I eat pizza.")
  Space.create(:title => "Test Thing Two", :description => "Other times I eat cookies.")
end