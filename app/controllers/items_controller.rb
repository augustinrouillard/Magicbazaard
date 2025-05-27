class ItemsController < ApplicationController

def index
  @items = Item.all
end

def show
 item = Item.all

end

def new
end

def create
end

def edit
end

def update
end

def destroy
end

private

def items_params
  params.require(:items).permit(:name, :price, :description, :power, :category)
end

    # t.string "description"
    # t.string "name"
    # t.float "price"
    # t.float "rating"
    # t.integer "power"
    # t.string "category"

# FAIRE MIGRATION PHOTO ITEMS

end
