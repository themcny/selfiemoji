require 'net/http'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def headshot_post_save(file_path)
  	# p "*" * 50
    # p "file_path:"
		# p file_path

    uri = URI('https://api.projectoxford.ai/emotion/v1.0/recognize')
    uri.query = URI.encode_www_form({
        # Request parameters
        # 'faceRectangles' => '{string}'
    })

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = ENV["PRIMARY_KEY"]
    # Request body
    p "*" * 50
    p "request.body:"
    request.body = {"url" => "http://the100percentyou.com/wp-content/uploads/2011/03/Happy-Boy.jpg"}
    p request.body
    p "*" * 50

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end
    p "*" * 50
    p response
    puts response.body

	end
end
