class ProductsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  
  def new
    @product = Product.new
    @product_images = @product.product_images.build
    #セレクトボックスの初期値設定
    @parents = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @parents << parent.category_name
    end
  end

  def create
    @product = Product.new(product_params)
    @product.status = "出品中"
    binding.pry
    if @product.save!
      redirect_to root_path, notice: '商品を出品しました'
    else
      @product.product_images.build
      render :new
    end
  end

   # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(category_name: "#{params[:parent_name]}", ancestry: nil).children
    # @category_children = Category.find(params[:parentValue]).children
 end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
    # @category_grandchildren = Category.find(params[:childValue]).children
    
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :condition, :shipping_charges, :shipping_area, :days_to_delivery, :price, :category_id, [product_images_attributes: [:image]]).merge(user_id: current_user.id)
  end
end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
