module ApplicationHelper

	#Define a title for the pages
	def baseTitle
		base_title = "Ruby On Rails"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
end
