class Statistic < ActiveRecord::Base
  PANES = %w{Blog Contact Profile Home}

  attr_accessible :name, :value

  def self.page_view
    where(:name => "Page view").first.value
  end
end