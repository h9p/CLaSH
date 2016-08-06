if !bd[message.from.id] && !@config["bban"].include?(message.from.id)
	if message.text.to_s.start_with?("هدية") && message.text.to_s.split.length == 3 && db[message.from.id] && message.reply_to_message && db[message.reply_to_message.from.id]
		m = message.text.to_s.split
		case m[1]
		when "جواهر"
			if db[message.from.id]["Gems"] >= m[2].to_i
				db[message.from.id]["Gems"] -= m[2].to_i
				db[message.reply_to_message.from.id]["Gems"] += m[2].to_i
			    bot.api.send_message(chat_id: message.chat.id, text: "#{message.from.first_name} #{message.from.last_name} gifted #{message.reply_to_message.from.first_name} #{message.reply_to_message.from.last_name} #{m[2]} 💎." )
			else
			    bot.api.send_message(chat_id: message.chat.id, text: "You don't have enough gems 💎")
			end
		when "موارد"
			if db[message.from.id]["res"] >= m[2].to_i
				db[message.from.id]["res"] -= m[2].to_i
				db[message.reply_to_message.from.id]["res"] += m[2].to_i
			    bot.api.send_message(chat_id: message.chat.id, text: "#{message.from.first_name} #{message.from.last_name} gifted #{message.reply_to_message.from.first_name} #{message.reply_to_message.from.last_name} #{m[2]} 🍎" )
			else
			    bot.api.send_message(chat_id: message.chat.id, text: "You don't have enough resources 🍎")
			end
		when "دفاع"
			if db[message.from.id]["Defanse"] >= m[2].to_i
				db[message.from.id]["Defanse"] -= m[2].to_i
				db[message.reply_to_message.from.id]["Defanse"] += m[2].to_i
			    bot.api.send_message(chat_id: message.chat.id, text: "#{message.from.first_name} #{message.from.last_name} gifted #{message.reply_to_message.from.first_name} #{message.reply_to_message.from.last_name} #{m[2]} 🕸" )
			else
			    bot.api.send_message(chat_id: message.chat.id, text: "لا يوجد لديك دفاعات كافية ❌")
		    end
		end
	end
end