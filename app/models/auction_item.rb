class AuctionItem < ActiveRecord::Base
  attr_accessible :auction_id, :auction, :name, :code, :link, :start_bid,
                  :current_bid, :bidder

  belongs_to :auction
  has_many :auction_bids, :dependent => :destroy

  before_update :create_bid

  def next_valid_bid
    rules = self.auction.auction_rules
    rules.each do |rule|
      if (rule.bid_from..rule.bid_to) === self.current_bid || rule.to == 0
        self.current_bid + rule.bid_step
      else
        0
      end
    end
  end

  private
  def create_bid
    return false if self.current_bid <= self.next_valid_bid
    self.auction_bids.create(:bidder => self.bidder, :amount => self.current_bid)
  end
end
