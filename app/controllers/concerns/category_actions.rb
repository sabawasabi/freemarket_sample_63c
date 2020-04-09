module CategoryActions
  extend ActiveSupport::Concern

  def set_categories
  @category_parents    = Category.where(params[:id])
  @category_children1  = Category.where(ancestry:  1)
  @category_children2  = Category.where(ancestry:  2)
  @category_children3  = Category.where(ancestry:  3)
  @category_children4  = Category.where(ancestry:  4)
  @category_children5  = Category.where(ancestry:  5)
  @category_children6  = Category.where(ancestry:  6)
  @category_children7  = Category.where(ancestry:  7)
  @category_children8  = Category.where(ancestry:  8)
  @category_children9  = Category.where(ancestry:  9)
  @category_children10 = Category.where(ancestry: 10)
  @category_children11 = Category.where(ancestry: 11)
  @category_children12 = Category.where(ancestry: 12)
  @category_children13 = Category.where(ancestry: 13)
  end
 
end