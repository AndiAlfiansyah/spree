class Spree::Admin::BankAccountsController < Spree::Admin::BaseController
  def show
    @mutations = Spree::BankAccount.get_mutations(params[:id])
  end
end
