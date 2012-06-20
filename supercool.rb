require 'manifesto.rb'
require 'sinatra'

set :public_folder, 'public'

get "/" do
  redirect '/index.html'
end

get "/old" do
  redirect '/index-old.html'
end


get '/cache.manifest' do
  headers 'Content-Type' => 'text/cache-manifest' # Must be served with this MIME type
  Manifesto.cache :network_includes => ['http://supercool.ac', '*'], :excludes => ['src/', '*.less']
end