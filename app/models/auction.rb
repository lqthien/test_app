class Auction < ActiveRecord::Base
  attr_accessible :name, :description, :owner, :password, :expire_at,
                  :auction_rules_attributes, :auction_items_attributes

  has_many :auction_items, :dependent => :destroy
  has_many :auction_rules, :dependent => :destroy

  accepts_nested_attributes_for :auction_items, :allow_destroy => true
  accepts_nested_attributes_for :auction_rules, :allow_destroy => true
end