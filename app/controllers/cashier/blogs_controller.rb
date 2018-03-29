class Cashier::BlogsController < ApplicationController
  
  def index
    @blogs = Blog.all
  end
  
  def new
    @blog = Blog.new
    puts "================="
    puts @blog
    puts @blog == nil
    puts @blog.id
    puts @blog.id == nil
    puts @blog.weather
    puts @blog.weather == nil
    puts "=========="
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
  
  private
  def blog_params
    params.require(:blog).permit(
      :weather, :content, :user_id, :published_at )
  end
end
