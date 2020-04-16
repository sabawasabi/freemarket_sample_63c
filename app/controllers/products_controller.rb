class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @product = Product.order("created_at DESC").limit 3
  end

  def new
    @product = Product.new
    @product.product_images.build
  end

  def create
    @product = Product.new(product_params)
    @product.status = "出品中"
    if @product.product_images.empty?
      redirect_to new_product_path, notice:"画像を投稿してください"
      return
    elsif @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @category = @product.category
    @child_categories = Category.where('ancestry = ?', "#{@category.parent.ancestry}")
    @grand_child = Category.where('ancestry = ?', "#{@category.ancestry}")
  end

  def update
    if @product.product_images.empty?
      redirect_to new_product_path, notice:"画像を投稿してください"
      return
    elsif @product.update(product_params)
      redirect_to root_path
    else
      redirect_to edit_product_path
    end
  end

  def show
    @product = Product.find(params[:id])
    @product_transaction = Transaction.where(product_id: @product.id)
  end

   # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def show
    @product = Product.find(params[:id])
    @product_transaction = Transaction.where(product_id: @product.id)
  end

  # 孫カテゴリーが選択された後に動くアクション
  def get_size
    selected_grandchild = Category.find("#{params[:grandchild_id]}") #孫カテゴリーを取得
    if related_size_parent = selected_grandchild.products_sizes[0] #孫カテゴリーと紐付くサイズ（親）があれば取得
      @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得
    else
      selected_child = Category.find("#{params[:grandchild_id]}").parent #孫カテゴリーの親を取得
      if related_size_parent = selected_child.products_sizes[0] #孫カテゴリーの親と紐付くサイズ（親）があれば取得
        @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得
      end
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :brand, :condition, :shipping_charges, :shipping_area, :category_id, :products_size_id, :days_to_delivery, :price, [product_images_attributes: [:id, :image, :_destroy]]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
