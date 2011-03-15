OLD_NUMBER = ENV['OLD_NUMBER'] # This must be provisioned on Twilio
NEW_NUMBER = ENV['NEW_NUMBER']

# You'll get a better rendition of your number if you spell it out digit
# by digit, i.e. "four one five, eight eight eight, one one one one", etc.

GREETING_MESSAGE = <<EOT
Hello. Jon Cooper here. 
I have a new number. 
#{NEW_NUMBER}.
That's #{NEW_NUMBER}. 
To be connected now, press 1. 
Press any other key to repeat this message.
EOT

CONNECTING_MESSAGE = <<EOT
Connecting your call...
EOT

SMS_REPLY_MESSAGE = <<EOT
Jon Cooper's software here. I have a new number: #{NEW_NUMBER}. 
I'll forward this text for you though, no need to resend.
EOT

