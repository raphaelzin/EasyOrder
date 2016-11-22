class AdminsController < ApplicationController
  helper_method :value_at_weekday, :value_for_hour, :value_for_waiter

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
    @orders = Order.all
    if (params[:start_date].present? and params[:start_date][0] != "") && (params[:end_date].present? and params[:end_date][0] != "")
      @start_date = params[:start_date][0].to_date.beginning_of_day
      @end_date = params[:end_date][0].to_date.end_of_day

      @orders = Order.search(@start_date, @end_date)
    end
    flash[:success] = params[:commit]

    params[:start_date] = nil
    params[:end_date] = nil
    
    # create_random_data
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

  def value_at_weekday(orders)
    totalWeekDay = []

    for i in 0..6
      total = 0
      orders.each do |o|
        if o.created_at.wday == i
          total = total + o.bill_value
        end
      end
      totalWeekDay[i] = total.round(2)
    end
    totalWeekDay
  end

  def value_for_hour(orders)
    
    totalHours = Hash.new

    for i in 0..23
      total = 0
      orders.each do |o|
        if o.created_at.localtime.hour == i
          total = total + o.bill_value
        end
      end
      totalHours["#{i}:00"] = total.round(2)
    end
    totalHours
  end

  def value_for_waiter(orders)
    totalHash = Hash.new
    Waiter.all.each do |w|
      total = 0
      w.orders.each do |o|
        if orders.include? o
          total += o.bill_value
        end
      end
      totalHash[w.name] = total.round(2)
    end
    totalHash
  end

  def create_random_data

    for i in 0..80


      @dish1 = Dish.find( 1 + rand(10) )

      @dish2 = Dish.find( 1+rand(10) )

      @client = Client.find(1)

      @waiter = Waiter.find( 1 + rand(6) )

      @order = Order.new

      @order.dishes << @dish1
      @order.dishes << @dish2
      @order.waiter = @waiter
      @order.client = @client

      @order.created_at = rand((1 + rand(7)).days).seconds.ago
      @order.updated_at = rand((1 + rand(7)).days).seconds.ago

      @order.save

    end

  end

  def admin_params
    params.require(:admin).permit(:name,:password)
  end
end
