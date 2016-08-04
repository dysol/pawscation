class ListingsController < ApplicationController
  before_action :require_login,  only:  [ :new, :create, :destroy ]
  before_action :correct_user,   only:  :destroy

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.build(permitted_listing_params)

    if @listing.save
      flash[:success] = 'Your space has been listed!'
      redirect_to root_url(anchor: 'main')
    else
      render 'listings/new'
    end

  end

  def destroy
    @listing.destroy
    flash[:success] = "Listing deleted"
    redirect_to user_path(id: current_user.id, anchor: 'main') || root_url
  end

  private

    def permitted_listing_params
      params.require(:listing).permit(:content, :address, :photo)
    end

    def correct_user
     @listing = current_user.listings.find_by(id: params[:id])
     redirect_to root_url if @listing.nil?
    end
end
