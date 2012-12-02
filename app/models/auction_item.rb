class AuctionItem < ActiveRecord::Base
  attr_accessible :auction_id, :auction, :name, :code, :link, :start_bid,
                  :current_bid, :bidder

  belongs_to :auction
  has_many :auction_bids, :dependent => :destroy

  before_update :create_bid

  private
  def create_bid
    self.auction_bids.create(:bidder => self.bidder, :amount => self.current_bid)
  end
end