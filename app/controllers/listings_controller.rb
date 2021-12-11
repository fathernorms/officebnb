class ListingsController < ApplicationController

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR address ILIKE :query"
      @listings = Listing.where(sql_query, query: "%#{params[:query]}%")
    elsif params[:guest_number].present?
      @listings = Listing.where("capacity >= ?", params[:guest_number])
    else
      @listings = Listing.all
    end
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
    @host = @listing.user == current_user
    @listing_reviews = []

    @listing.bookings.where(booking_status: "COMPLETED").each do |booking|
      if booking.review
        @listing_reviews << booking.review
      end
    end

    @marker = [{ lat: @listing.latitude, lng: @listing.longitude }]
    if current_user
      @booking = current_user.bookings.build(listing: @listing)
    else
      @booking = Booking.new
    end
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
