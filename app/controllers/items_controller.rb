class ItemsController < ApplicationController

def index
  @items = Item.all
  if params[:query].present?
    sql_subquery = "name ILIKE :query"
    @items = @items.where(sql_subquery, query: "%#{params[:query]}%")
  end
  if params[:category].present?
    sql_subquery_category = "category ILIKE :category"
    @items = @items.where(sql_subquery_category, category: "%#{params[:category]}%")
  end
  @user = current_user
end

def show
 @item = Item.find(params[:id])
 @user = current_user
end

def new
  @item = Item.new
  @user = current_user
end

def create

  @item = Item.new(items_params)
  @item.user = current_user

  if @item.save
    redirect_to item_path(@item), notice: 'Item was successfully created.'
  else
    render :new, alert: 'Error creating item.'
  end
end

def edit
  @item = Item.find(params[:id])
  if @item.user != current_user
    redirect_to item_path(@item), alert: 'You are not authorized to edit this item.'
  end
  @user = current_user
end

def update
  @item = Item.find(params[:id])
  @item.update(items_params)
  redirect_to item_path(@item)
end


def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path, status: :see_other
  end

private

def items_params
  params.require(:item).permit(:name, :price, :description, :power, :category, :image, :long_description)
end

    # t.string "description"
    # t.string "name"
    # t.float "price"
    # t.float "rating"
    # t.integer "power"
    # t.string "category"

# FAIRE MIGRATION PHOTO ITEMS

end
