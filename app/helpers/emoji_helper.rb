module EmojiHelper
  def emojify(content)
    Twemoji.parse(h(content)).html_safe if content.present?
  end
end
