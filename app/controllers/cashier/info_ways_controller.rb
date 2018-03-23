class Cashier::InfoWaysController < Cashier::BaseController
  before_action :set_info_way, only: [:update, :destroy]

  def index
    @info_ways = InfoWay.all
    @info_way = InfoWay.new
  end
  
  def update
    if @info_way.update(info_way_params)
      redirect_to cashier_info_ways_path
      flash[:notice] = "消息來源資料已更新"
    else
      @info_ways = InfoWay.all
      render :index
    end
  end
  
  def create
    @info_way = InfoWay.new(info_way_params)
    
    if @info_way.save
      flash[:notice] = "消息來源資料已更新"
      redirect_to cashier_info_ways_path
    else
      @info_ways = InfoWay.all
      render :index
    end
    
  end
  
  def destroy   
    if @info_way.destroy
      flash[:notice] = "消息來源資料已刪除"
      redirect_to cashier_info_ways_path
    else
      @info_ways = InfoWay.all
      render :index
    end
  end
  
  private
  def info_way_params
    params.require(:info_way).permit(:news_channel)
  end
  
  def set_info_way
    @info_way = InfoWay.find(params[:id])
  end 
end
