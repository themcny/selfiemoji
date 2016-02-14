include EmojiHelper
require 'RMagick'
class PicturesController < ApplicationController
  helper :headshot
  def index
    picture = emotion_to_emoji("happiness")
    src = Magick::Image.read("public/emoji/#{picture}")[0]
    dst = Magick::Image.read("public/headshots/headshot_capture_2300_1455425315.jpg")[0]
    result = dst.composite(src, Magick::CenterGravity, 30, -40, Magick::OverCompositeOp)
    result.write('public/composite2.gif')
  end


end
