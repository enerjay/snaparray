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

  private

  def post_params  
    params.require(:snap).permit(:image, :caption)
  end  


end
