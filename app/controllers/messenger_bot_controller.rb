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
                "text":"#{profile_last_name} #{profile_first_name}さんこんにちは。あなたの曲探しをお手伝いします",
                "buttons":[
                    {
                        "type":"postback",
                        "title":"曲を探す",
                        "payload":"OVER"
                    },
                    {
                        "type":"postback",
                        "title":"何もしない",
                        "payload":"UNDER"
                    }
                ]
            }
         }
      })
      
      if text == "お気に入り"
        sender.reply({ text: "お気に入り一覧" })
      elsif text == "検索"
        sender.reply({ text: "曲名、あるいはアーティスト名を教えてください。"})
      elsif 
        sender.reply({ text: "すみません、分かりませんでした。"})
      end
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
                "text":"#{profile_last_name} #{profile_first_name}さんは今どんな気分ですか？",
                "buttons":[
                    {
                        "type":"postback",
                        "title":"ノリノリで行きたい",
                        "payload":"HIGHTEMPO"
                    },
                    {
                        "type":"postback",
                        "title":"リラックスしたい",
                        "payload":"LOWTEMPO"
                    }
                ]
            }
        }
      })
      
      when "UNDER"
             sender.reply({ text: "わかりました。またいつでも呼んでくださいね。"})
    
      when "HIGHTEMPO"
        sender.reply({ "attachment":{
            "type":"template",
            "payload":{
                "template_type":"button",
                "text":"ノリノリといえばこんな感じでしょうか？",
                "buttons":[
                    {
                        "type":"postback",
                        "title":"クラブで踊りたい",
                        "payload":"clubmusic"
                        
                    },
                    {
                        "type":"postback",
                        "title":"リオのカーニバルに行きたい",
                        "payload":"brazil"
                    }
                ]
            }
         }
      })
      when "LOWTEMPO"
          sender.reply({ "attachment":{
            "type":"template",
            "payload":{
                "template_type":"button",
                "text":"リラックスといえばこんな感じでしょうか？",
                "buttons":[
                    {
                        "type":"postback",
                        "title":"地中海のリゾートでのんびりしたい",
                        "payload":"bossanova"
                        
                    },
                    {
                        "type":"postback",
                        "title":"ホテルの最上階のラウンジでお酒を飲みたい",
                        "payload":"jazz"
                    }
                ]
            }
         }
      })
      when "clubmusic"
          sender.reply({ text: "クラブミュージック"})
      when "brazil"
          sender.reply({ text: "サンバ" })
      when "bossanova"
          sender.reply({ text: "ボサノバ"})
      when "jazz"
          sender.reply({ text: "ジャズ" })
      
      #ex) process sender.reply({text: "button click event!"})
    end
    
  end
end