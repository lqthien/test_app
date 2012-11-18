class Statistic < ActiveRecord::Base
  PANES = %w{Blog Contact Profile Home}

  attr_accessible :name, :value

  def self.page_views
    where(:name => "Page view").first.value
  end

  def self.add_page_view
    where(:name => "Page view").first.update_attributes(:value => (page_views.to_i + 1).to_s)
  end
end