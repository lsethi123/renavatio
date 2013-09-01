module ApplicationHelper

	def subnav_content_module(options = {}, &block)
		render :partial => "shared/subnav", :locals => {:options => options, :block => block}
	end

end
