require 'twilio-ruby'

# put your own credentials here
account_sid = 'SKd3516f4379a9b849305954900053465e'
auth_token = '[AuthToken]'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
  :from => '+16507302789',
  :to => '+14154243199',
  :body => 'Hey Armani! I hope you like my pics!',
  :media_url => 'http://pof.com/1075/bae.jpg',
})
