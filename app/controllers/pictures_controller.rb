include EmojiHelper
class PicturesController < ApplicationController
  helper :headshot
  def index
  end


end


require 'net/http'

uri = URI('https://api.projectoxford.ai/emotion/v1.0/recognize')
uri.query = URI.encode_www_form({
    # Request parameters
    'faceRectangles' => '{string}'
})

request = Net::HTTP::Post.new(uri.request_uri)
# Request headers
request['Content-Type'] = 'application/json'
# Request headers
request['Ocp-Apim-Subscription-Key'] = '{subscription key}'
# Request body
request.body = "{body}"

response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
    http.request(request)
end

# puts response.body
