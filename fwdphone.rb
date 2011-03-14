def phone_greeting
  message = <<EOT
Hello. Jon Cooper here. 
I have a new number. 
Four one five. eight six zero. six two three eight. 
That's four one five. eight six zero. six two three eight. 
To be connected now, press 1. 
Press any other key to repeat this message.
EOT
  builder = Nokogiri::XML::Builder.new do |xml|
    xml.Response {
      xml.Gather(:numDigits => 1) {
        xml.Say message
      }
      xml.Redirect
    }
  end
  builder.to_xml
end

def forward_phone_call
  builder = Nokogiri::XML::Builder.new do |xml|
    xml.Response {
      xml.Say "Connecting your call..."
      xml.Dial "415-860-6238"
    }
  end
  builder.to_xml
end

def sms_response
  my_new_number = "+14158606238"
  my_old_number = "+16469222416" # This must be provisioned on Twilio
  from = params['From']
  body = params['Body']
  puts body
  
  builder = Nokogiri::XML::Builder.new do |xml|
    xml.Response {
      xml.Sms(:to => from, :from => my_old_number) {
        xml.text "Jon Cooper's software here. I have a new number: 415 860 6238. I'll forward this text for you though, no need to resend."
      }
      xml.Sms(:to => my_new_number, :from => my_old_number) {
        xml.text "fwd from #{from} - #{body}"
      }
    }
  end
  builder.to_xml
end

class FwdPhone < Sinatra::Base
  get '/' do
    '808 bump, make you put yo hands up'
  end
  
  get '/incomingCall' do
    # headers 'Content-Type' => 'text/xml'
    if params['Digits'] == '1'
      forward_phone_call
    else
      phone_greeting
    end
  end
  
  get '/incomingSMS' do
    headers 'Content-Type' => 'text/xml'
    sms_response
  end
end

