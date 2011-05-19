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
  
  get '/longSMS' do
    headers 'Content-Type' => 'text/xml'
    "<Response><Sms>Crackalackin ipsum dolizzle tellivizzle amizzle, shit adipiscing elit. Nullizzle sapizzle velizzle, volutpizzle, suscipizzle quizzle, i saw beyonces tizzles and my pizzle went crizzle vizzle, arcu. Pellentesque go to hizzle nizzle. Sizzle erizzle. Cool izzle dolizzle dapibus that's the shizzle tempizzle funky fresh. Mauris brizzle nibh izzle turpizzle. Vestibulum izzle tortor. Rizzle gizzle rhoncus nisi. In hizzle habitasse shizzle my nizzle crocodizzle dictumst. Fo shizzle dapibizzle. Gangsta tellus urna, pretium gizzle, mattizzle ac, eleifend vitae, fo. Away suscipizzle. Integizzle bow wow wow velit fo shizzle purus.</Sms></Response>"
  end
  
  get '/incomingSMS' do
    headers 'Content-Type' => 'text/xml'
    TwiML.sms_response(params)
  end
end

