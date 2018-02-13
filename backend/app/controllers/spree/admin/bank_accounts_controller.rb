class Spree::Admin::BankAccountsController < Spree::Admin::BaseController
  def show
    @mutations = Spree::BankAccount.get_mutations(params[:id])
  end

  def update_bank_list
  	Spree::BankAccount.get_bank_list
  end
end
