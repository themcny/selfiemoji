require 'net/http'
include EmojiHelper
require 'RMagick'

class PicturesController < ApplicationController
  helper :headshot
  def index
    @image_path = "/headshots/#{HeadshotPhoto.last.image_file_name}"
    emoji_pic = emotion_to_emoji("happiness")
    src = Magick::Image.read("public/emoji/#{emoji_pic}")[0]
    dst = Magick::Image.read("public/headshots/headshot_capture_2300_1455425315.jpg")[0]
    # coord_x = (faceRectangle["left"] + (faceRectangle["width"]/2)) - 150
    # coord_y = (faceRectangle["top"] + (faceRectangle["height"]/2)) - 200
    result = dst.composite(src, Magick::CenterGravity, -30, 40, Magick::OverCompositeOp)
    result.write('public/composite2.gif')
  end

  def get_emotion
  	p "0" * 50
  	imgur_session = Imgurapi::Session.new(client_id: ENV['IMGUR_CLIENT_ID'], client_secret: ENV['IMGUR_CLIENT_SECRET'], access_token: ENV['IMGUR_ACCESS_TOKEN'], refresh_token: ENV['IMGUR_REFRESH_SECRET'])

  	account = imgur_session.account.account
  	image = imgur_session.image.image_upload("public/#{params[:image]}")
  	p image.link

    uri = URI('https://api.projectoxford.ai/emotion/v1.0/recognize')
    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = ENV['PRIMARY_KEY']
    # Request body

    request.body = {url: image.link}.to_json
    puts request.body

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end

    p "*" * 50
    p response.body

    redirect_to root_path
  end
end
