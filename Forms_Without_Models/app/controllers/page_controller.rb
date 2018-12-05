class PageController < ApplicationController
  def home
  end

  def contact_us

    @first_name = params['first_name']
    @last_name = params['last_name']
    @phone_number = params['phone_number']
    @user_email = params['user_email']
    @question = params['question']
    @contact_type = params['contact_type']
    @subscribed = params['newsletter'] == "subscribed" ? true : false
    @submit = params["commit"]

    error_string = ""
    if @first_name == ""
      error_string << " First Name is required! "
    end

    if @last_name == ""
      error_string << " Last Name is required! "
    end

    if @user_email == ""
      error_string << " Email is required! "
    end

    if error_string != ""
      flash.now[:error]= error_string
    end
    @product_names = []
    @products = Product.all
    @products.each do |product|
      @product_names << product.name
    end
    @selected_product = params['product']

    if(@submit == "Submit Question")
      #Send Email
      UserMailer.contact_email.deliver_now
      UserMailer.thanks_email(@user_email).deliver_now
    end
  end

  def products
    @products = {
        "Snow Skiis" => "$200.00",
        "Snow Boards" => "$150.00",
        "Snow Boots" => "$100.00",
        "Mittens" => "$9.00",
        "Gloves" => "$15.00",
        "Hat" => "$20.00"
    }



  end

  def preferences
  end

  def blog
  end

  def calendar

    @month = params[:month].to_i
    if @month == 0
      @month = Time.now.month #current month
    end

    @year = params["year"].to_i
    if @year == 0
      @year = Time.now.year
    end

  end

  def articles
  end

  def login
  end
end
