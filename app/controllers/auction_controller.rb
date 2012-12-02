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
    @auth = false
    @auth = true if (request.referer.present? && request.referer.include("forums.e-hentai.org") && (params[:hv_user].present? || session[:hv_user].present?)) || request.host == "localhost"
    session[:hv_user] = params[:hv_user] unless params[:hv_user].nil? || session[:hv_user].present?
    redirect_to "/auction" if(@auction = Auction.find_by_id(params[:id])).nil?
  end
end