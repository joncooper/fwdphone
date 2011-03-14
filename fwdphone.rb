def phone_greeting
   message = <<EOT
Hello. Jon Cooper here. 
I have a new number. 
Four one five. eight six zero. six two three eight. 
That's four one five. eight six zero. six two three eight. 
To be connected now, press 1. 
Press any other key to repeat this message.
EOT
    response = Twilio::Response.new
    gather = response.append(Twilio::Gather.new(:numDigits => '1'))
    gather.append(Twilio::Say.new(message))
    response.append(Twilio::Redirect.new())
    response.respond
end

def forward_phone_call
  message = "Connecting your call..."
  response = Twilio::Response.new
  response.append(Twilio::Say.new(message))
  response.append(Twilio::Dial.new('415-860-6238'))
  response.respond
end

def sms_response
  my_new_number = "+14158606238"
  my_old_number = "+16469222416" # This must be provisioned on Twilio
  from = params['From']
  body = params['Body']
  
  response = Twilio::Response.new
  sms_to_person_who_texted = Twilio::Sms.new("Jon Cooper's software here. I have a new number: 415 860 6238. I'll forward this text for you though, no need to resend.")
  sms_to_me = Twilio::Sms.new("fwd from #{from} - #{body}", :to => my_new_number, :from => my_old_number)
  response.append(sms)
  response.respond
end

class FwdPhone < Sinatra::Base
  get '/' do
    '808 bump, make you put yo hands up'
  end
  
  get '/incomingCall' do
    if params['Digits'] == '1'
      forward_phone_call
    else
      phone_greeting
    end
  end
  
  get '/incomingSMS' do
    sms_response
  end
end

