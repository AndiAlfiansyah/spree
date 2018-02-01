module Spree
  class TransferInvoice < Spree::Base
    belongs_to :payment_method
    belongs_to :user, class_name: Spree.user_class.to_s, foreign_key: 'user_id',
                      optional: true
    has_many :payments, as: :source
    has_many :virtual_accounts

    def set_amount_identifier
      update amount_identifier: rand(999)
    end
  end

  def self.imported
    true
  end
end
