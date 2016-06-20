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
                        "title":"OVER",
                        "payload":"はいどうも"
                    },
                    {
                        "type":"postback",
                        "title":"UNDER",
                        "payload":"誰あんた"
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
    payload = event["postback"]["payload"]
    case payload
    when :something
      #ex) process sender.reply({text: "button click event!"})
    end
  end
end