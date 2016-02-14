require 'twilio-ruby' 

class TwilioController < ApplicationController
	def  post 
	  # put your own credentials here 
		# Required for any Twilio Access Token
		account_sid = ENV['ACCOUNT_SID'] 
		api_key = ENV['API_KEY']
		api_secret = ENV['API_SECRET']

		auth_token = ENV['AUTH_TOKEN']
		 
		# set up a client to talk to the Twilio REST API 
		@client = Twilio::REST::Client.new account_sid, auth_token 
		 
		@client.account.messages.create({
		  :from => '+16507302789', 
		  :to => '+14154243199', 
		  :body => 'Hey Armani! I hope you like my pics!', 
		  # :media_url => 'http://pof.com/1075/bae.jpg', 
		})
	end	
end


