class ProductsController < ApplicationController

  def index
    # @products = Product.all
    @products = Product.where.not(user_id:current_user).where(buyer_id:0)
    # @products = Product.where.not(buyer_id == current_user)
  end

  def update
    Product.find_by(id: params["id"]).update(buyer_id:current_user.id, date:DateTime.now)
    redirect_to :back
  end
  
  def create
    product = Product.create(product: params[:product], amount: params[:amount], date: Date.today, user_id: current_user.id)
    redirect_to :back
    # if(student.valid? == false)
    # redirect_to "/dojo/#{params[:dojo_id]}/students/new", alert: student.errors.full_messages
    # end
  end

  def show
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to :back
  end
  
end
