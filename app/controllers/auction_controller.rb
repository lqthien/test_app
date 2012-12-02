class AuctionController < ApplicationController
  layout "layouts/auction"
  before_filter :set_hvuser
  def index

  end

  def create
    auction = Auction.new(params[:auction])
    if auction.save
      session[:created_auction_id] = auction.id
      redirect_to "/auction/show/#{auction.id}"
    else
      redirect_to "/auction/index"
    end
  end

  def show
    @auth = false
    @auth = true if (request.referer.present? && request.referer.include("forums.e-hentai.org") && (params[:hv_user].present? || session[:hv_user].present?)) || request.host == "localhost" || session[:created_auction_id] == params[:id]
    redirect_to "/auction" if(@auction = Auction.find_by_id(params[:id])).nil?
  end

  def set_hvuser
    session[:hv_user] = params[:hv_user] unless params[:hv_user].nil? || session[:hv_user].present?
  end

  def bid
    return if(@item = AuctionItem.find_by_id(params[:item_id])).nil? || session[:hv_user].nil?
    @valid = params[:amount].to_i >= @item.next_valid_bid
    if @valid
      @item.update_attributes(:bidder => session[:hv_user], :current_bid => params[:amount].to_i)
    end
    respond_to do |format|
      format.js
    end
  end

  def delete
    return if(auction = Auction.find_by_id(params[:id])).nil?
    @valid = params[:pass] == auction.password
    if @valid
      auction.destroy
    end
    respond_to do |format|
      format.js
    end
  end
end