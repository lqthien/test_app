class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :add_page_view

  protected
  def add_page_view
    Statistic.add_page_view
  end
end
