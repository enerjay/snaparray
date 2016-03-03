class SnapsController < ApplicationController
  def index
    @snaps = Snap.all
  end

  def new
    @snap = Snap.new
  end

  def create
    @snap = Snap.create(post_params)
    redirect_to snaps_path  
  end
  def update  
    @snap = Snap.find(params[:id])
    @snap.update(post_params)
    redirect_to(snap_path(@snap))
  end
  def edit  
    @snap = Snap.find(params[:id])
  end  

  def show  
    @snap = Snap.find(params[:id])
  end  

  private

  def post_params  
    params.require(:snap).permit(:image, :caption)
  end  


end
