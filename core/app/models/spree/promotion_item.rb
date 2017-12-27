module Spree
  class PromotionItem < Spree::Base
    validates :name, presence: true
    has_many :promotions
  end
end
