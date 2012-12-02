class Auction < ActiveRecord::Base
  attr_accessible :name, :description, :owner, :password, :expire_at

  has_many :auction_items, :dependent => :destroy
  has_many :auction_rules, :dependent => :destroy
end