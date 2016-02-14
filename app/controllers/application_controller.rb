require 'net/http'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def headshot_post_save(file_path)
  	p "0" * 50
    p "file_path:"
		p file_path

    uri = URI('https://api.projectoxford.ai/emotion/v1.0/recognize')


    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = "27d9fee3bc534fe58781b5d9aa9fcf7c"
    # Request body
    request.body = {url: file_path}.to_json

    # p "*" * 50
    # p request.body

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end

    p Rails.public_path

    p "*" * 50
    p response.body

	end
end
