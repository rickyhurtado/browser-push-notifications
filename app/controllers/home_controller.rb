class HomeController < ApplicationController
  def index
    render locals: { user_id: params[:user_id] }
  end
end
