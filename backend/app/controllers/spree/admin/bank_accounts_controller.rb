class Spree::Admin::BankAccountsController < Spree::Admin::BaseController
  def show
    @mutations = Spree::BankAccount.get_mutations(1)
  end
end
