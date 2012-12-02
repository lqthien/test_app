class AuctionController < ApplicationController
  layout "layouts/auction"
  def index

  end

  def create
    auction = Auction.new(params[:auction])
    if auction.save
      redirect_to "/auction/show/#{auction.id}"
    else
      redirect_to "/auction/index"
    end
  end

  def show
    redirect_to "/auction" if(@auction = Auction.find_by_id(params[:id])).nil?
  end
end