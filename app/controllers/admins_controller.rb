class AdminsController < ApplicationController
  
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:success] = 'Administrator added'
      redirect_to :back
    end
  end

  def staff
    @new = Waiter.new
    @waiters = Waiter.all
  end

  def categories
    @new = Category.new
    @categories = Category.all
  end

  def home
  end

  def login
    @new = Admin.new
  end

  def menu
    @new = Dish.new
    @dishes = Dish.all
    @category = Category.find(1)
  end

  def stats
  end

  def settings
    @admins = Admin.all
  end

  def tables
    @new = Table.new
    @tables = Table.all
  end

  def admin_params
    params.require(:admin).permit(:name,:password)
  end
end
