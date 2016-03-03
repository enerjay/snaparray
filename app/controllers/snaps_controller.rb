class SnapsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @snaps = Snap.all
  end

  def show  
    @snap = Snap.find(params[:id])
  end  

  def new
    @snap = Snap.new
  end

  def create
    if @snap = Snap.create(post_params)
    flash[:success] = "Your post has been created!"
    redirect_to snaps_path
    else
      flash.now[:alert] = "Your new post couldn't be created!  Please check the form."
        render :new
        end  
  end

  

  def edit  
    @snap = Snap.find(params[:id])
  end

  def update  
    @snap = Snap.find(params[:id])
    if @snap.update(post_params)
      flash[:success] = "Post updated."
    redirect_to(snap_path(@snap))
    else
      flash.now[:alert] = "Update failed.  Please check the form."
          render :edit
        end
  end

  def destroy  
    @snap = Snap.find(params[:id])
    @snap.destroy
    redirect_to snaps_path
  end  

  private

  def post_params  
    params.require(:snap).permit(:image, :caption)
  end 

  def set_post
      @snap = Snap.find(params[:id])
    end

end   

