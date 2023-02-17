class GroupsController < ApplicationController
  before_action :set_user, only: %i[index edit new create update destroy]
  def index
    @groups = @user.groups.all
  end

  def show
    @group = Group.find(params[:id])
    @entities = @group.entities.order(created_at: :desc)
  end
  
  def new
   @group = Group.new
  end
  
  def create
    @group = Group.create(**group_params, author_id: @user.id)

    if @group.save
      redirect_to groups_path, notice: 'Category has been added successfully'
    else
      flash.now[:error] = 'Category could not be saved, try again'
      render :new
    end
  end

  def edit
    @group = @user.groups.find(params[:id])
  end

  def update
    @group = @user.groups.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path , notice: 'Category has been updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @group = @user.groups.find(params[:id])
    if @group.destroy
      redirect_to groups_path, notice: 'Post was successfully destroyed.'
    else
      flash.now[:error] = 'Error: Post could not be deleted'
    end
  end

  private
  
  def set_user
    @user = current_user
  end
  
  def group_params
    params.require(:group).permit(:name, :icon)
  end
 
end