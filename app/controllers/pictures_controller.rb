include EmojiHelper
require 'RMagick'
class PicturesController < ApplicationController
  helper :headshot
  def index
    emoji_pic = emotion_to_emoji("happiness")
    src = Magick::Image.read("public/emoji/#{emoji_pic}")[0]
    dst = Magick::Image.read("public/headshots/headshot_capture_2300_1455425315.jpg")[0]
    # coord_x = (faceRectangle["left"] + (faceRectangle["width"]/2)) - 150
    # coord_y = (faceRectangle["top"] + (faceRectangle["height"]/2)) - 200
    result = dst.composite(src, Magick::CenterGravity, -30, 40, Magick::OverCompositeOp)
    result.write('public/composite2.gif')
  end


end
