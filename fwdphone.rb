class FwdPhone < Sinatra::Base
  get '/' do
    '808 bump, make you put yo hands up'
  end
  
  get '/incomingCall' do
    headers 'Content-Type' => 'text/xml'
    if params['Digits'] == '1'
      TwiML.forward_phone_call
    else
      TwiML.phone_greeting
    end
  end
  
  get '/incomingSMS' do
    headers 'Content-Type' => 'text/xml'
    TwiML.sms_response(params)
  end
end

