module Spree
  class PromotionItem < Spree::Base
    has_many :promotions
  end
end
