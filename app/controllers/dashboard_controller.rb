class DashboardController < ApplicationController
  def welcome

  end

  def switch
    respond_to do |format|
      format.js
    end
  end
end
