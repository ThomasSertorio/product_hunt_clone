class ProductsController < ApplicationController
  before_action :set_product, only: [:upvote]

  def index
    @products = Product.all
  end

  def upvote
    if user_signed_in?
      if current_user.voted_for? @product
        current_user.unvote_for @product
      else
        current_user.up_votes @product
      end
    else
      redirect_to new_user_session_path
    end

  end

  private
  def set_product
    @product = Product.find(params[:id])
  end
end
