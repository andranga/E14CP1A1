class ProductsController < ApplicationController
	def create
    @product = Product.new(product_params)
    @product.save
    redirect_to categories_path
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      respond_to do |format|
      format.html { redirect_to categories_path, notice: 'Proyect was successfully destroyed.' }
    end
  end

	private
	def product_params
      params.require(:product).permit(:name, :price, :category_id)
    end
end
