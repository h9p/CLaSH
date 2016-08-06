if message && db[message.from.id]
	if db[message.from.id]["Power"] >= 400 && db[message.from.id]["Power"] < 600 
			db[message.from.id]["level"] = 2

	end
end