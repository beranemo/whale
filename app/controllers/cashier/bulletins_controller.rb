class Cashier::BulletinsController < ApplicationController
  
  def index
    @bulletins = Bulletin.all
  end
  
  def new
    @bulletin = Bulletin.new
  end

  def create
    @bulletin = Bulletin.new(bulletin_params)
    @bulletin.user_id = current_user.id
    puts @bulletin
    if @bulletin.save
      flash[:notice] = "bulletin was successfully created"
      redirect_to cashier_bulletins_path
    else
      flash.now[:alert] = "bulletin was failed to create"
      render :new
    end
  end
  
  def show
    @bulletin = Bulletin.find(params[:id])
  end
  
  def edit
    @bulletin = Bulletin.find(params[:id])
  end
  
  def update
    @bulletin = Bulletin.find(params[:id])
    if @bulletin.update(bulletin_params)
      flash[:notice] = "bulletin was successfully updated"
      redirect_to cashier_bulletins_path
    else
      flash.now[:alert] = "bulletin was failed to update"
      render :edit
    end
  end


  private

  def bulletin_params
    params.require(:bulletin).permit(:title, :content, :user_id)
  end

  

end
