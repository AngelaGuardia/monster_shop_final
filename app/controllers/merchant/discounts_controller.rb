class Merchant::DiscountsController < Merchant::BaseController
  def index
    @merchant = current_user.merchant
  end

  def new
    @merchant = current_user.merchant
    @discount = Discount.new
  end

  def create
    @merchant = current_user.merchant
    @discount = @merchant.discounts.new(discount_params)
    if @discount.save
      flash[:success] = 'Your new discount has been saved.'
      redirect_to merchant_discounts_path
    else
      flash[:error] = @discount.errors.full_messages.to_sentence
      redirect_to new_merchant_discount_path
    end
  end

  private
    def discount_params
      params.require(:discount).permit(:name, :percentage, :minimum_quantity)
    end
end
