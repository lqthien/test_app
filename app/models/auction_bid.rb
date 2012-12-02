class AuctionBid < ActiveRecord::Base
  attr_accessible :auction_item_id, :auction_item, :bidder, :amount, :created_at, :updated_at

  belongs_to :auction_item
end