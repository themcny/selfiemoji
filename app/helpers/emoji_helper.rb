module EmojiHelper
  def emojify(emotion)
    Twemoji.parse(h(emotion_to_emoji(emotion))).html_safe if emotion.present?
  end
  def emotion_to_emoji(emotion)
    emojis_emotion = {
      'happiness' => ':laughing:',
      'sadness' => ':sob:',
      'surprise' => ':open_mouth:',
      'anger' => ':rage:',
      'fear' => ':fearful:',
      'contempt' => ':unamused:',
      'disgust' => ':mask:',
      'neutral' => ':neutral_face:'
    }
    return emojis_emotion[emotion]
  end
end
