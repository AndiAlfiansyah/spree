class Spree::Admin::ReceiptNumbersController < Spree::Admin::BaseController
  def index
  	@receipt_numbers = Spree::ReceiptNumber.order(:number).page params[:page]
    @all = Spree::ReceiptNumber.count
    @used = @receipt_numbers.where(used: true).count
  end

  def new
  	@receipt_number = Spree::ReceiptNumber.new
  end

  def destroy_all
  	Spree::ReceiptNumber.destroy_all

  	redirect_to spree.admin_receipt_numbers_path
  end

  def create
    @receipt_number = Spree::ReceiptNumber.new(receipt_number_params)

    if @receipt_number.save
      flash[:success] = Spree.t(:successfully_created)
    end

    redirect_to spree.admin_receipt_numbers_path
  end

  def create_by_range
    @receipt_number_by_range = params[:receipt_number_by_range]
  	insert_by_range(@receipt_number_by_range[:courier], @receipt_number_by_range[:start_num], @receipt_number_by_range[:end_num])

    redirect_to spree.admin_receipt_numbers_path
  end

  def insert_by_range(courier_name, start_num, end_num)
    (start_num.to_s..end_num.to_s).each do |num|
      Spree::ReceiptNumber.create(courier: courier_name, number: num)
    end
  end

  def destroy
  	@receipt_number = Spree::ReceiptNumber.find(params[:id])
  	@receipt_number.destroy

  	redirect_to spree.admin_receipt_numbers_path
  end

  def toggle_usage
  	@receipt_number = Spree::ReceiptNumber.find(params[:id])
  	@receipt_number.toggle_usage

  	redirect_to spree.admin_receipt_numbers_path
  end

  private
  	def receipt_number_params
  		params.require(:receipt_number).permit(:courier, :number, :used)
  	end
end
