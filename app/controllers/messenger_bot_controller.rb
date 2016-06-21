class MessengerBotController < ActionController::Base
  def message(event, sender)
    # profile = sender.get_profile(field) # default field [:locale, :timezone, :gender, :first_name, :last_name, :profile_pic]
    profile = sender.get_profile[:body]
    profile_last_name = profile['last_name']
    profile_first_name = profile['first_name']
    sender.reply({ "attachment":{
            "type":"template",
            "payload":{
                "template_type":"button",
                "text":"#{profile_last_name} #{profile_first_name}さんこんにちは",
                "buttons":[
                    {
                        "type":"postback",
                        "title":"はいどうも",
                        "payload":"OVER"
                    },
                    {
                        "type":"postback",
                        "title":"あんた誰",
                        "payload":"UNDER"
                    }
                ]
            }
         }
      })
    # sender.reply({ text: "#{profile_last_name} #{profile_first_name}さんこんにちは" })
    # sender.reply({ text: "Reply: #{event['message']['text']}" })
  end

  def delivery(event, sender)
  end

  def postback(event, sender)
    profile = sender.get_profile[:body]
    profile_last_name = profile['last_name']
    profile_first_name = profile['first_name']
    payload = event["postback"]["payload"]
    case payload
    when "OVER"
      
    sender.reply({ "attachment":{
            "type":"template",
            "payload":{
                "template_type":"button",
                "text":"猫と犬どちらがお好きですか？",
                "buttons":[
                    {
                        "type":"postback",
                        "title":"猫です。",
                        "payload":"OVER"
                    },
                    {
                        "type":"postback",
                        "title":"猫だよ",
                        "payload":"UNDER"
                    }
                ]
            }
        }
      })
      when "UNDER"
        sender.reply({ "attachment":{
            "type":"template",
            "payload":{
                "template_type":"button",
                "text":"私は、猫好きの女が作ったメッセンジャーボットです。ところで、#{profile_last_name}#{profile_first_name}さんは猫と犬どちらがお好きですか",
                "buttons":[
                    {
                        "type":"postback",
                        "title":"もちろん猫",
                        "payload":"OVER"
                    },
                    {
                        "type":"postback",
                        "title":"やっぱり猫",
                        "payload":"UNDER"
                    }
                ]
            }
         }
      })
      #ex) process sender.reply({text: "button click event!"})
    end
  end
end