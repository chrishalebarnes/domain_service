class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :update, :destroy]

  def index
    respond_to do |format|
      format.json { render json: Account.all }
    end  	
  end

  def create
    @account = Account.new(account_params)
    respond_to do |format|
      if @account.save
        format.json { render json: @account, status: :created }
      else
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end  	
  end

  def show
    respond_to do |format|
      format.json { render json: @account}
    end  	
  end

  def update
  	respond_to do |format|
      if @account.update(account_params)
      	format.json { render json: @account, status: :ok }
      else
      	format.json { render json: @account.errors, status: :unprocessable_entity }
      end
  	end  	
  end

  def destroy
  	respond_to do |format|
  	  if @account.destroy
  	    format.json { render json: Account.all, status: :ok }
  	  else
  	  	format.json { render json: @account.errors, status: :unprocessable_entity }
  	  end
  	end  	
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:id, :name)
    end    
end