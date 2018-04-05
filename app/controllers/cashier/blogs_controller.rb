class Cashier::BlogsController < ApplicationController
  
  def index
    @blogs = Blog.all.order(published_at: :desc)
  end
  
  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    @blog.published_at = Time.now
    if @blog.save
      flash[:notice] = "成功新增日誌紀錄"
      redirect_to cashier_blogs_path
    else
      flash.now[:alert] = @blog.errors.full_messages.to_sentence
      render :new
    end
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      flash[:notice] = "成功更新日誌"
      redirect_to cashier_blogs_path
    else
      flash.now[:alert] = @blog.errors.full_messages.to_sentence
      render :edit
    end
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      flash[:notice] = "日誌已成功刪除"
      redirect_to cashier_blogs_path
    else
      @blogs = Blog.all
      render :index
    end
  end
  
  private
  def blog_params
    params.require(:blog).permit(
      :weather, :content, :user_id, :published_at )
  end
end
