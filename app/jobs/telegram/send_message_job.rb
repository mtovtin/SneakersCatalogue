class Telegram::SendMessageJob < ApplicationJob
  queue_as :default

   def perform(text)
     token = '1559879861:AAEEY9_gzhKzE4mOY74MHiVIpVcC1bPnTvE'
     Telegram::Bot::Client.run(token) do |bot|
       bot.api.send_message(chat_id: 500475378, text: text)
     end
   end
 end