
## Forward phone calls and SMSes from a deprecated mobile phone number to a new one.

I moved from NYC to SF fairly recently and wanted to get a local mobile phone number, but without losing the ability for people that had my old one to get in touch with me. 

fwdphone is the solution to that problem.

fwdphone will:

- Receive voice calls on your old number, inform the caller that you have a new number, and let them press a key to be connected to you on the new number.

- Receive SMSes on your old number, send a reply to the sender informing them that you have a new number, and forward the initial SMS on to you at the new number.

It will cost, at the moment (March 2011), assuming US numbers:

- $1/mo for the inbound number
- $0.03 per minute for forwarded calls ($0.01 inbound + $0.02 outbound)
- $0.06 per forwarded SMS ($0.02 receive + $0.02 send x2)

## How to set it up

### Port your number to Twilio

1. Set up a [Twilio](http://www.twilio.com/) account and fund it.
2. Read the [Twilio Porting FAQ](http://www.twilio.com/faq/porting) and do what it says.
3. Call your mobile phone carrier to initiate the porting request.
4. Wait a rather long time. (In my case, nearly a month).
5. Receive notification that the number has ported to Twilio.

### Host this application + configure messages

I am hosting this on Heroku. If you're doing the same and have bundler and the Heroku gem installed:

1. git clone git@github.com:joncooper/fwdphone.git
1. Edit messages.rb
1. heroku create
1. git push heroku master

### Configure phone endpoints

Next, set up the environment variables for your phone endpoints:

1. heroku config:add OLD_NUMBER=1646XXXYYYY
1. heroku config:add NEW_NUMBER=1415XXXYYYY

### Wrap up Twilio configuration

Finally, login to your Twilio account, visit the 'Numbers' tab, and click 'Edit' next to the number you've ported.

1. Point the Voice URL to {YOUR ROOT URL}/incomingCall and make sure to select GET rather than POST.
1. Point the SMS URL to {YOUR ROOT URL}/incomingSMS and make sure to select GET rather than POST.

### Test

Call the old number from someone else's phone. Do you hear the right message? Press 1 to be forwarded. Does that work?

Send an SMS to the old number. Do you get the correct reply? Does your new number get the forwarded SMS?

Rejoice!

# Released under the MIT license

Copyright (C) 2011 by Jon Cooper

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
