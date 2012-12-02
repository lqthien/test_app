class AuctionRule < ActiveRecord::Base
  attr_accessible :auction_id, :auction, :bid_from, :bid_to, :bid_step, :percent

  belongs_to :auction
end