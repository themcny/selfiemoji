module EmojiHelper
  def emoji_test(content, **options)
    Twemoji.parse(h(content), options).html_safe if content.present?
  end
  def emojify(emotion)
    Twemoji.parse(h(emotion_to_emoji(emotion))).html_safe if emotion.present?
  end
  def emotion_to_emoji(emotion)
    emojis_emotion = {
      'happiness' => 'joy.png',
      'sadness' => 'sob.png',
      'surprise' => 'surprise.png',
      'anger' => 'rage.png',
      'fear' => 'fearful.png',
      'contempt' => 'contempt.png',
      'disgust' => 'disgust.png',
      'neutral' => 'neutral.png'
    }
    return emojis_emotion[emotion]
  end
end
