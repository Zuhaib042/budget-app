class EntitiesController < ApplicationController
  before_action :set_user
  before_action :set_group
  
  def index
    @group = Group.find(params[:group_id])
    @entities = @group.entities.order(created_at: :desc)
  end

  def new
    @entity = Entity.new
  end
   
  def create
    @entity = Entity.create(**entity_params, user_id: @user.id)
    @group = Group.find(params[:group_id])
    @group.entities << @entity

    if @entity.save
      redirect_to group_entities_path(@group), notice: 'Transaction has been added successfully'
    else
      flash.now[:error] = 'Transaction could not be saved, try again'
      render :new
    end
  end
  
  def destroy
    @group = Group.find(params[:group_id])
    @entity = @group.entities.find(params[:id])
    if @entity.destroy
      redirect_to group_entities_path(@group), notice: 'Entity was successfully destroyed.'
    else
      flash.now[:error] = 'Error: Entity could not be deleted'
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @entity = @group.entities.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @entity = @group.entities.find(params[:id])
    if @entity.update(**entity_params, user_id: @user.id)
      redirect_to group_entities_path(@group) , notice: 'Category has been updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def set_user
    @user = current_user
  end

  def set_group
    @group = @user.groups.find(params[:group_id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end