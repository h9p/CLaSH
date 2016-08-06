#Encoding: UTF-8

if @config["Devlopers"].include?(message.from.id)
	case message.text
	when "#تفعيل"
		@config["Groups"].insert(0,message.chat.id)
		bot.api.send_message(chat_id: message.chat.id, text: "⚔ تم تفعيل البوت في المجموعة بنجاح ⚔" )
	when "#prom"
		@config["Admins"].insert(0,message.reply_to_message.from.id)
		bot.api.send_message(chat_id: message.chat.id, text: "#{message.reply_to_message.from.first_name} #{message.reply_to_message.from.last_name} has been promoted" )
	when "#تعطيل"
		@config["Groups"].delete(message.chat.id)
		bot.api.send_message(chat_id: message.chat.id, text: "⚔ تم تعطيل البوت في المجموعة بنجاح ⚔" )
	when "#dem"
		@config["Admins"].delete(message.reply_to_message.from.id)
		bot.api.send_message(chat_id: message.chat.id, text: "#{message.reply_to_message.from.first_name} #{message.reply_to_message.from.last_name} has been disqualified" )
	end
end
if @config["Admins"].include?(message.from.id)
	case message.text
	when "#المطور"
		bot.api.send_message(chat_id: message.chat.id, text: "⚔Clash Of Fire #{V}⚔\nBy @HeEeM" )
	when "شنو هاي اللعبة"
		bot.api.send_message(chat_id: message.chat.id, text: "⚔Clash Of Fire #{V}⚔\n ⚔ لعبة حربية رائعة على التلغرام ⚔ " )
	end
	if message.text == "#id" 
		bot.api.send_message(chat_id: message.chat.id, text: message.chat.id, reply_to_message: message.message_id)
	elsif message.text == "#ids" && message.reply_to_message
		bot.api.send_message(chat_id: message.chat.id, text: message.reply_to_message.from.id )
	elsif message.text == "#bban" && message.reply_to_message && !@config["Devlopers"].include?(message.reply_to_message.from.id)
		bd[message.reply_to_message.from.id] = message.reply_to_message.from.id
		bot.api.send_message(chat_id: message.chat.id, text: "#{message.reply_to_message.from.username} has been permanently blocked from the game" )
	elsif message.text == "#ban" && message.reply_to_message && !@config["Devlopers"].include?(message.reply_to_message.from.id)
		@config["bban"].insert(0,message.reply_to_message.from.id)
		bot.api.send_message(chat_id: message.chat.id, text: "#{message.reply_to_message.from.username} has been blocked from the game" )
	elsif message.text == "#unban" && message.reply_to_message && !@config["Devlopers"].include?(message.reply_to_message.from.id)
		@config["bban"].delete(message.reply_to_message.from.id)
		bot.api.send_message(chat_id: message.chat.id, text: "#{message.reply_to_message.from.username} has been unblocked" )
	end
end
if  !bd[message.from.id] && !@config["bban"].include?(message.from.id)
	case message.text
	when "#تسجيل"
		if db[message.from.id]
			bot.api.send_message(chat_id: message.chat.id, text: "لقد قمت بالتسجيل مسبقاً ⚔" )
		else
			db[message.from.id] = {"Power"=>150,
				"Defanse"=>100,
				"res"=>600,
				"Gems"=>60,
				"Attacks"=>0,
				"Wins"=>0,
				"Loses"=>0,
				"Defanse_a"=>0,
				"dd_win"=>0,
				"dd_loses"=>0,
				"level"=>1,
				"Shield"=>true,
				"clan"=>"none"
			}
			bot.api.send_message(chat_id: message.chat.id, text: "تم تسجيلك بنجاح ⚔" )
			puts "#{message.from.username} HAS BEEN SIGNED UP".on_green
		end
	when "#الحالة"
		if db[message.from.id]
			bot.api.send_message(chat_id: message.chat.id, text: "👾 اللاعب: #{message.from.first_name} #{message.from.last_name}\n🏅 المستوى: #{db[message.from.id]["level"]}\n💪 القوة: #{db[message.from.id]["Power"]}\n🕸 الدفاع: #{db[message.from.id]["Defanse"]}\n🍎 الموارد: #{db[message.from.id]["res"]}\n💎  الجواهر: #{db[message.from.id]["Gems"]}\n🔰 الدرع: #{db[message.from.id]["Shield"]}\n⚔ عدد الهجمات: #{db[message.from.id]["Attacks"]}\n👍--الانتصار: #{db[message.from.id]["Wins"]}\n👎--الهزيمة: #{db[message.from.id]["Loses"]}\n🎯 لدفاعات: #{db[message.from.id]["Defanse_a"]}\n👍--الانتصار: #{db[message.from.id]["dd_win"]}\n👎--الهزيمة: #{db[message.from.id]["dd_loses"]}\n " )
		else
			bot.api.send_message(chat_id: message.chat.id, text: "لم تسجل في اللعبة الى الان للتسجيل في اللعبة قم بكتابة #تسجيل" )
		end
	when "#المتجر"
		bot.api.send_message(chat_id: message.chat.id, text: "💲💲💲المتجر💲💲💲\nللشراء ارسل :\nشراء [قوة,دفاع,موارد] [1,2,3]\n》💪 Power Points\n1 -   50💪 for 10💎\n2 - 100💪 for 15💎\n3 - 250💪 for 30💎\n》🕸 defense Points\n1 -  50 🕸 for 10 💎\n2 - 100🕸 for 15 💎\n3 - 250🕸 for 30 💎\n》🍎 Resources\n1 -   300🍎 for 15💎\n2 -   600🍎 for 25💎\n3 - 1400🍎 for 35💎" )
	end

	if message.text == "#دخول" && db[message.from.id]
		db[message.from.id]["Shield"] = false
		bot.api.send_message(chat_id: message.chat.id, text: "تم تعطيل الدرع بنجاح 🔰" )
	elsif message.text == "#خروج" && db[message.from.id]
		db[message.from.id]["Shield"] = true
		bot.api.send_message(chat_id: message.chat.id, text: "تم تفعيل الدرع بنجاح 🔰" )
	end

	if message.text == "info" && db[message.from.id] && message.reply_to_message && db[message.reply_to_message.from.id]
		bot.api.send_message(chat_id: message.chat.id, text: "👾 Player: #{message.reply_to_message.from.first_name} #{message.reply_to_message.from.last_name}\n🏅 Level: #{db[message.reply_to_message.from.id]["level"]}\n💪 Power: #{db[message.reply_to_message.from.id]["Power"]}\n🕸 Defense: #{db[message.reply_to_message.from.id]["Defanse"]}\n🍎 Resources: #{db[message.reply_to_message.from.id]["res"]}")
	elsif message.text == "حذف الحساب" && db[message.from.id]
		db.delete(message.from.id)
		bot.api.send_message(chat_id: message.chat.id, text: "⚔ تمت اعادة ضبط حسابك من جديد ⚔" )
	end
end 