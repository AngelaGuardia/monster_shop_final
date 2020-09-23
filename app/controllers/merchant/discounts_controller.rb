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

  def edit
    @merchant = current_user.merchant
    @discount = Discount.find(params[:id])
  end

  def update
    @discount = Discount.find(params[:format])
    @discount.attributes = discount_params
    if @discount.save
      flash[:success] = 'Your discount has been updated.'
      redirect_to merchant_discounts_path
    else
      flash[:error] = @discount.errors.full_messages.to_sentence
      redirect_to "/merchant/discounts/#{@discount.id}/edit"
    end
  end

  def destroy
    Discount.find(private_params[:id]).destroy
    redirect_to merchant_discounts_path
  end

  private
    def discount_params
      params.require(:discount).permit(:name, :percentage, :minimum_quantity, :id)
    end

    def private_params
      params.permit(:id)
    end
end
