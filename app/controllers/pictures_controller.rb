require 'net/http'
include EmojiHelper
require 'RMagick'

class PicturesController < ApplicationController
  helper :headshot
  def index
    @image_path = "/headshots/#{HeadshotPhoto.last.image_file_name}"
  end

  def get_emotion
  	imgur_session = Imgurapi::Session.new(client_id: ENV['IMGUR_CLIENT_ID'], client_secret: ENV['IMGUR_CLIENT_SECRET'], access_token: ENV['IMGUR_ACCESS_TOKEN'], refresh_token: ENV['IMGUR_REFRESH_SECRET'])

  	account = imgur_session.account.account
  	image = imgur_session.image.image_upload("public/#{params[:image]}")

    uri = URI('https://api.projectoxford.ai/emotion/v1.0/recognize')
    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = ENV['PRIMARY_KEY']
    # Request body

    request.body = {url: image.link}.to_json

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end

    response.body
    p "hot bod __ " * 50
    p response.body
    json = JSON.parse(response.body)
    # json.first['faceRectange']
    p "JSON __ " * 50
    p json
    emojify(json.first)
    redirect_to root_path
  end

  def emojify(json_object)
    emoji_pic = emotion_to_emoji(json_object["scores"].max_by{|k,v| v}[0])
    src = Magick::Image.read("public/emoji/#{emoji_pic}")[0]
    resized_src = src.resize_to_fill(json_object["faceRectangle"]["width"], json_object["faceRectangle"]["height"])
    dst = Magick::Image.read("public/headshots/#{HeadshotPhoto.last.image_file_name}")[0]
    coord_x = (json_object["faceRectangle"]["left"] + (json_object["faceRectangle"]["width"]/2)) - 150
    coord_y = (json_object["faceRectangle"]["top"] + (json_object["faceRectangle"]["height"]/2)) - 200
    result = dst.composite(resized_src, Magick::CenterGravity, coord_x, coord_y, Magick::OverCompositeOp)
    result.write('public/new.png')
  end
end
