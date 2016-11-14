class AdminsController < ApplicationController
  
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:success] = 'Administrator added'
      redirect_to root_path
    end
  end

  def staff
    nonAdminRedirect


    @new = Waiter.new
    @waiters = Waiter.all
  end

  def categories
    nonAdminRedirect

    @new = Category.new
    @categories = Category.all
  end

  def home
    nonAdminRedirect
  end

  def login
    
  end

  def menu
    nonAdminRedirect

    @new = Dish.new
    @dishes = Dish.all
    @category = Category.find(1)
  end

  def stats
    nonAdminRedirect
  end

  def settings
    @new = Admin.new
    @admins = Admin.all
  end

  def tables
    nonAdminRedirect
    @new = Table.new
    @tables = Table.all
  end

  def nonAdminRedirect
    if not current_admin.present?
      redirect_to root_path
    end
  end


  def admin_params
    params.require(:admin).permit(:name,:password)
  end
end
