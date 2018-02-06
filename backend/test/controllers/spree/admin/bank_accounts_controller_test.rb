require 'test_helper'

class Spree::Admin::BankAccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get spree_admin_bank_accounts_show_url
    assert_response :success
  end

end
