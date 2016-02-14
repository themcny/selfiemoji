include EmojiHelper
class PicturesController < ApplicationController
  helper :headshot
  def index
  	@image_path = "/headshots/#{HeadshotPhoto.last.image_file_name}"
  end

  def get_emotion
  	p "0" * 50
    uri = URI('https://api.projectoxford.ai/emotion/v1.0/recognize')

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = ENV['PRIMARY_KEY']
    # Request body
    
    request.body = {url: }.to_json

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end

    p "*" * 50
    p response.body
  end
end
