class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @user = current_user
    @listing.user = @user
    if @listing.save
      redirect_to @listing
    else
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update(listing_params)
      redirect_to @listing
    else
      render :edit
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @marker = [{ lat: @listing.latitude, lng: @listing.longitude }]
    @booking = current_user.bookings.build(listing: @listing)
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    redirect_to root_path
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :address, :description, :capacity, :rate_per_day, photos: [])
  end

end
