require 'net/http'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def headshot_post_save(file_path)
  	p "0" * 50
    uri = URI('https://api.projectoxford.ai/emotion/v1.0/recognize')


    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = ENV['PRIMARY_KEY']
    p ENV['PRIMARY_KEY']
    # Request body
    request.body = {url: HeadshotPhoto.last.image_file_name}.to_json

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end

    p "*" * 50
    p response.body

    super

	end
end
