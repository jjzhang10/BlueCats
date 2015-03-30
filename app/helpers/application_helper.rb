module ApplicationHelper
	def title
		base_title="Scotty's House Internship Application System"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
end
