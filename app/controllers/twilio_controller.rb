require 'twilio-ruby'
 
class TwilioController < ApplicationController
  include Webhookable
 
  after_filter :set_header
  
  skip_before_action :verify_authenticity_token
 
  def voice
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Hello there. Thank you for testing Marks voice app. Please enjoy this music. Have a great day.', :voice => 'alice'
         r.Play 'http://linode.rabasa.com/cantina.mp3'
    end
 
    render_twiml response
  end
end