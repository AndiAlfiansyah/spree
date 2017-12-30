module Spree
	class VirtualAccount < Spree::Base
		belongs_to :user
		belongs_to :transfer_invoice
	end
end 