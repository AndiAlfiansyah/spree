module Spree
	module Admin
		class Export::BaseController < ApplicationController
		  protected

		  def set_attachment_name(name)
		  	puts "set_attachment_name 1"
		    escaped = URI.encode(name)
		  	puts "set_attachment_name 2"
		    response.headers['Content-Disposition'] = "attachment; filename*=UTF-8''#{escaped}"
		  end
		end
	end
end