module Spree
	module Admin
		module Export
			class BaseController < ApplicationController
			  protected

			  def set_attachment_name(name)
			    escaped = URI.encode(name)
			    response.headers['Content-Disposition'] = "attachment; filename*=UTF-8''#{escaped}"
			  end
			end
		end
	end
end