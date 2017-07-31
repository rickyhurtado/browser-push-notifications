class HomeController < ApplicationController
  def index
    render locals: { id: 0, user_id: params[:user_id] }
  end
end
