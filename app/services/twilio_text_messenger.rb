require 'twilio-ruby'
class TwilioTextMessenger
  attr_reader :message



  def initialize(message)
    @message = message
  end

  def call
    byebug
    def acc_id 
   Rails.application.credentials.twilio_account_sid

      # Rails.application.secrets.twilio_account_sid = 'ACbab9f1a4b98036a21b4cdffc1ee42411'
  end

  def auth_token
    Rails.application.credentials.twilio_auth_token
    # auth_token = Rails.application.secrets.twilio_auth_token = 'a127ac810091063e6aa491b50fa308ff'
  end

     # phone_no = Rails.application.secrets.twilio_phone_number
    # acc_id = 'ACbab9f1a4b98036a21b4cdffc1ee42411'
    # auth_token = 'a127ac810091063e6aa491b50fa308ff'

    client = Twilio::REST::Client.new(acc_id ,auth_token)
    client.account.messages.create({
      from: '+16089245346' ,
      to: '+919479640518',
      body: message
    })
  
    
  end
end
