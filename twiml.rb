class TwiML
  require './messages.rb'
  
  def self.phone_greeting
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.Response {
        xml.Gather(:numDigits => 1, :method => 'GET') {
          xml.Say GREETING_MESSAGE
        }
        xml.Redirect
      }
    end
    builder.to_xml
  end

  def self.forward_phone_call
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.Response {
        xml.Say CONNECTING_MESSAGE
        xml.Dial NEW_NUMBER
      }
    end
    builder.to_xml
  end

  def self.sms_response(params)
    from = params['From']
    body = params['Body']
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.Response {
        xml.Sms(:to => from, :from => OLD_NUMBER) {
          xml.text SMS_REPLY_MESSAGE
        }
        xml.Sms(:to => NEW_NUMBER, :from => OLD_NUMBER) {
          xml.text "#{from}-#{body}"
        }
      }
    end
    builder.to_xml
  end
end
