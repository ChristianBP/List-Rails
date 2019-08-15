class ListItemsController < ApplicationController

  def create
    list = User.find(params[:id]).default_lists[0]
    @new_item = ListItem.new(list_item_params)
    @new_item.default_list = list
    @new_item.save
    redirect_to(user_path(params[:id]))
  end

  private

  def list_item_params
    params.require(:list_item).permit(:value, :dueDate)
  end
end
