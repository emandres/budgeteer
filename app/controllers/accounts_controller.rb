class AccountsController < ApplicationController
  respond_to :html
  before_filter :set_type

  def index
    @accounts = type_class.all
    respond_with @accounts
  end

  def show
    @account = type_class.find(params[:id])
    respond_with @account
  end

  def new
    @account = type_class.new
    respond_with @account
  end

  def create
    @account = type_class.new(account_params)
    if @account.save
      redirect_to send("#{@type}_path", @account)
    else
      render 'new'
    end
  end

  def edit
    @account = type_class.find(params[:id])
    respond_with @account
  end

  def update
    @account = type_class.find(params[:id])
    if @account.update_attributes(account_params)
      redirect_to send("#{@type}_path", @account)
    else
      render 'edit'
    end
  end

  def destroy
    @account = type_class.find(params[:id])
    @account.destroy
    redirect_to index_path
  end

  private
  def set_type
    @type ||= request.original_url.match(/((expense_|revenue_)?account)/)[1]
  end

  def type_class
    Object.const_get(@type.camelize)
  end

  def index_path
    send("#{@type.pluralize}_path")
  end

  def account_params
    params.require(@type.to_sym).permit(:name, :type)
  end
end
