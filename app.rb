require 'sinatra'

get '/' do
	send_file("index.html")	
end 

get '/menu' do
	menus = ["김밥", "칼국수", "스테이크", "짜장면"]
	# 해쉬(hash)
	menu_url = {
		"김밥" => "data:image/jpeg;base64,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", 
		"칼국수" => "data:image/jpeg;base64,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",
		"스테이크" => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStFDewXlGAIxl08ReX4ZBNjVngK7UY0wd_syp0_4BYumvYNlFWkQ",
		"짜장면" => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ35GA8UN3OtsERXX0cTPHm9_EapDGFga11Er_VKioWRZV_9NrCXQ"
	}
	
	@menu = menus.sample
	@url = menu_url[@menu]

	# if @menu == "김밥"
	# 	@url = urls[0]		
	# elsif @menu == "칼국수"
	#  	@url = urls[1]
	# elsif @menu == "스테이크"
	#  	@url = urls[2]
	# else 
	#  	@url = urls[3]
	#  end

	 erb :menu
end
