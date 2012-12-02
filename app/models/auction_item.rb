class AuctionItem < ActiveRecord::Base
  attr_accessible :auction_id, :auction, :name, :code, :link, :start_bid,
                  :current_bid, :bidder

  belongs_to :auction
  has_many :auction_bids, :dependent => :destroy

  before_update :create_bid

  def next_valid_bid(old_bid = nil)
    rules = self.auction.auction_rules
    bid = old_bid || self.current_bid
    rules.each do |rule|
      if (rule.bid_from..rule.bid_to) === bid || rule.bid_to == 0
        if bid.nil?
          return self.start_bid
        else
          return rule.percent? ? (bid * (100 + rule.bid_step) / 100.0).ceil
                               : bid + rule.bid_step
        end
      else
        0
      end
    end
  end

  private
  def create_bid
    self.auction_bids.create(:bidder => self.bidder, :amount => self.current_bid) unless self.bidder.nil?
  end
end