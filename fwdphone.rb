class FwdPhone < Sinatra::Base
  get '/' do
    'Hello world! Weeee-ooo!'
  end
  
  get '/env' do
    ENV.inspect
  end
end