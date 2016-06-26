class MessengerBotController < ActionController::Base
  def message(event, sender)
    # profile = sender.get_profile(field) # default field [:locale, :timezone, :gender, :first_name, :last_name, :profile_pic]
  profile = sender.get_profile[:body]
    profile_last_name = profile['last_name']
    profile_first_name = profile['first_name']
    
  {
      "setting_type":"call_to_actions",
  "thread_state":"new_thread",
  "call_to_actions":[
    {
      "message":{
        "text":"現実逃避BGMボットへようこそ！"
      }
    }
  ]
  }
    
    sender.reply({ "attachment":{
            "type":"template",
            "payload":{
                "template_type":"button",
                "text":"#{profile_last_name} #{profile_first_name}さんこんにちは",
                "buttons":[
                    {
                        "type":"postback",
                        "title":"こんにちは",
                        "payload":"OVER"
                    },
                    {
                        "type":"postback",
                        "title":"話したくない",
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
                "text":"#{profile_last_name} #{profile_first_name}さんの現実逃避をお手伝いします。どんな気分に浸りたいですか？",
                "buttons":[
                    {
                        "type":"web_url",
                        "url":"https://soundcloud.com/tags/deep%20house",
                        "title":"クラブで踊りたい",
                        
                    },
                    {
                        "type":"web_url",
                        "url":"https://soundcloud.com/tags/bossanova",
                        "title":"地中海のリゾートでのんびりしたい",
                        
                    },
                    {
                        "type":"postback",
                        "title":"どっちも興味ない",
                        "payload":"THIRD"
                    }
                ]
            }
        }
      })
      when "THIRD"
             sender.reply({ "attachment":{
            "type":"template",
            "payload":{
                "template_type":"button",
                "text":"こちらはいかがですか？",
                "buttons":[
                    {
                        "type":"web_url",
                        "title":"ホテルの最上階のバーでお酒を飲みたい",
                        "url":"https://soundcloud.com/tags/jazz"
                    },
                    {
                        "type":"postback",
                        "title":"アラスカでオーロラを見たい",
                        "url":"https://soundcloud.com/search?q=enya"
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
                "text":"少しお疲れではないですか？現実逃避のお手伝いをしますよ",
                "buttons":[
                    {
                        "type":"web_url",
                        "title":"ホテルの最上階のバーでお酒を飲みたい",
                        "url":"https://soundcloud.com/tags/jazz"
                    },
                    {
                        "type":"postback",
                        "title":"アラスカでオーロラを見たい",
                        "url":"https://soundcloud.com/search?q=enya"
                    }
                ]
            }
         }
      })
      #ex) process sender.reply({text: "button click event!"})
    end
  end
end