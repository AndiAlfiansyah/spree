class Spree::Admin::BankAccountsController < Spree::Admin::BaseController
  def show
  	Spree::BankAccount.get_bank_list
  	@bank = Spree::BankAccount.where(bank_id: params[:id]).first
    @mutations = Spree::BankAccount.get_mutations(params[:id], params[:page])
  end

  def update_bank_list
  	Spree::BankAccount.get_bank_list
  end
end
