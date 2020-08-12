require 'sinatra/base'
require 'rack-flash'
require_relative './models/database_start_script'
require_relative './models/space'

class MakersBnb < Sinatra::Base

  set :static, true
  enable :sessions, :method_override
  use Rack::Flash



  get '/login' do
    erb :'login'
  end

  post '/login' do
    redirect '/dashboard'
  end

  get '/dashboard' do
    erb :'dashboard'
  end


  get '/signup' do
    erb :'sign_up'
  end

  post '/signup' do
    redirect '/dashboard'
  end

  get '/hostings' do
    erb :'your_hostings'
  end

  get '/space_details' do
    erb :'space_details'

  get '/' do
    'Welcome to MakersBnb'
    erb(:index)

  end

  post '/spaces/add' do
    Spaces.add(name: params[:space_name], price: params[:price], description: params[:description],
      availability_start: params[:availability_start], availability_end: params[:availability_end],
      host_id: params[:host_id])
    erb(:index)
  end

  get '/spaces' do
    @spaces = Spaces.all
    erb(:index)
  end

end
