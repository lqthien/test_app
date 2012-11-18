class BlogPost < ActiveRecord::Base
  attr_accessible :title, :content, :date, :created_by

  belongs_to :author, :foreign_key => "created_by", :class_name => "User"
  belongs_to :updater, :foreign_key => "updated_by", :class_name => "User"
  validates :title, :content, :date, presence: true
end