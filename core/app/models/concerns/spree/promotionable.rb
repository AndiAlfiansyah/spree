module Spree
  module Promotionable
    extend ActiveSupport::Concern

    included do
    	attr_accessor :my_promotion_item, :total_items, :after_discount, :total_discount_from_promo
    end


    def has_promo?
    	# itung jumlah product * quantity
    	# jika lebih dari > true
    	# kalau engga false
    	products = self.line_items
    	# result_product = self.line_items.count
    	self.total_items = line_items.pluck(:quantity).sum
    	# result_product + total_quantity

    	check_if_promo_available

    end

    def check_if_promo_available
    	promo 	= Spree::PromotionItem.first
    	item 	= promo.quantity

    	is_available 			= total_items.to_i >= item.to_i
		(self.my_promotion_item 	= promo) if is_available
    	is_available
    end

    def display_total_after_discount
    	return self.total unless has_promo?
        calculate_discount_promo
        price_order = item_total.to_i
        puts formula = price_order.to_i - self.total_discount_from_promo
		self.after_discount = formula
    end

    def calculate_discount_promo
        return 0 unless has_promo?
        item    = my_promotion_item.quantity
        action  = my_promotion_item.action_disc.downcase

        return unless total_items.to_s.to_i >= item.to_s.to_i

        price_order = item_total.to_i
        discount = my_promotion_item.discount

        puts self.total_discount_from_promo = action.eql?("persentase") ? (price_order.to_i * discount.to_i)/100 : discount.to_i
    end
  end
end
