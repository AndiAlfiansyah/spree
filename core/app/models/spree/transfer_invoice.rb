module Spree
  class TransferInvoice < Spree::Base
    belongs_to :payment_method
    belongs_to :user, class_name: Spree.user_class.to_s, foreign_key: 'user_id',
                      optional: true
    has_many :payments, as: :source
  end
end
