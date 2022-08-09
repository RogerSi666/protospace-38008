class PrototypesController < ApplicationController
  before_action :set_prototype, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]



  def index 
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end
  
  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else   
      render :new
    end  
  end  

  def show
    @comment = Comment.new
    @comments = @prototype.comments
    @user = User.find_by(id: @prototype.user_id)
    @prototype = Prototype.find(params[:prototype_id] || params[:id])
    end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end

  def destroy
    @prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end 

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def contributor_confirmation
      redirect_to root_pat unless current_user == @prototype.user
    end
  
end
