if !bd[message.from.id] && !@config["bban"].include?(message.from.id)
	if message.text.to_s.start_with?("شراء") && message.text.to_s.split.length == 3 && db[message.from.id]
		f = message.text.split
		case f[1]
		when 'قوة','💪'
			if f[2].to_i == 1 && db[message.from.id]["Gems"] >= 10
				db[message.from.id]["Power"] += 50
				db[message.from.id]["Gems"] -= 10
		    	bot.api.send_message(chat_id: message.chat.id, text: "تم شراء ( 50 من القوة 💪 ) ب10 جواهر فقط 💎" )
		    elsif f[2].to_i == 2 && db[message.from.id]["Gems"] >= 20
				db[message.from.id]["Power"] += 100
				db[message.from.id]["Gems"] -= 20
		    	bot.api.send_message(chat_id: message.chat.id, text: "تم شراء ( 100 من القوة 💪 ) ب20 جوهرة فقط 💎" )
		    elsif f[2].to_i == 3 && db[message.from.id]["Gems"] >= 30
				db[message.from.id]["Power"] += 250
				db[message.from.id]["Gems"] -= 30
		    	bot.api.send_message(chat_id: message.chat.id, text: "تم شراء ( 250 من القوة 💪 ) ب30 جوهرة فقط 💎" )
		    else
		    	bot.api.send_message(chat_id: message.chat.id, text: "عذراً لايمكنك الشراء لعدم توفر الجواهر 💎")
			end
		when 'دفاع','🕸'
			if f[2].to_i == 1 && db[message.from.id]["Gems"] >= 10
				db[message.from.id]["Defanse"] += 50
				db[message.from.id]["Gems"] -= 10
		    	bot.api.send_message(chat_id: message.chat.id, text: "تم شراء ( 50 من الدفاع 🕸 ) ب10جواهر فقط 💎" )
		    elsif f[2].to_i == 2 && db[message.from.id]["Gems"] >= 20
				db[message.from.id]["Defanse"] += 100
				db[message.from.id]["Gems"] -= 20
		    	bot.api.send_message(chat_id: message.chat.id, text: "تم شراء ( 100 من الدفاع 🕸 ) ب20جوهرة فقط 💎" )
		    elsif f[2].to_i == 3 && db[message.from.id]["Gems"] >= 30
				db[message.from.id]["Defanse"] += 250
				db[message.from.id]["Gems"] -= 30
		    	bot.api.send_message(chat_id: message.chat.id, text: "تم شراء ( 250 من الدفاع 🕸 ) ب30جوهرة فقط 💎" )
		    else
		    	bot.api.send_message(chat_id: message.chat.id, text: "عذراً لايمكنك الشراء لعدم توفر الجواهر 💎" )
			end
		when 'موارد','🍎'
			if f[2].to_i == 1 && db[message.from.id]["Gems"] >= 15
				db[message.from.id]["res"] += 300
				db[message.from.id]["Gems"] -= 15
		    	bot.api.send_message(chat_id: message.chat.id, text: "تم شراء ( 300 من الموارد 🍎 ) ب15جوهرة فقط 💎" )
		    elsif f[2].to_i == 2 && db[message.from.id]["Gems"] >= 25
				db[message.from.id]["res"] += 600
				db[message.from.id]["Gems"] -= 25
		    	bot.api.send_message(chat_id: message.chat.id, text: "تم شراء ( 600 من الموارد 🍎 ) ب25جوهرة فقط 💎" )
		    elsif f[2].to_i == 3 && db[message.from.id]["Gems"] >= 35
				db[message.from.id]["res"] += 1200
				db[message.from.id]["Gems"] -= 35
		    	bot.api.send_message(chat_id: message.chat.id, text: "تم شراء ( 1200 من الموارد 🍎 ) ب35جوهرة فقط 💎" )
		    else
		    	bot.api.send_message(chat_id: message.chat.id, text: "عذراً لايمكنك الشراء لعدم توفر الجواهر 💎" )
			end
		end
	end
end