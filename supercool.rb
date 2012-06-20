require 'sinatra'

set :public_folder, 'public'

get "/" do
  redirect '/index.html'
end

get "/old" do
  redirect '/index-old.html'
end