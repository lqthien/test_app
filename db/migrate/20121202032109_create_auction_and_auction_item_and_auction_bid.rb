class CreateAuctionAndAuctionItemAndAuctionBid < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string  "name"
      t.string  "description"
      t.string  "owner"
      t.string  "password"
      t.datetime "expire_at"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table :auction_rules do |t|
      t.integer  "auction_id"
      t.integer  "bid_from"
      t.integer  "bid_to"
      t.integer  "bid_step"
      t.boolean  "percent", :default => :false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table :auction_items do |t|
      t.integer  "auction_id"
      t.string   "name"
      t.string   "code"
      t.string   "link"
      t.integer  "start_bid"
      t.integer  "current_bid"
      t.string   "bidder"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table :auction_bids do |t|
      t.integer  "auction_item_id"
      t.string   "bidder"
      t.integer  "amount"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
