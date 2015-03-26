class DomainsController < ApplicationController
  before_action :set_domain, only: [:show, :update, :destroy]

  def index
    respond_to do |format|
      format.json { render json: Domain.all }
    end   
  end

  def create
    @domain = Domain.new(domain_params)
    respond_to do |format|
      if @domain.save
        format.json { render json: @domain, status: :created }
      else
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end   
  end

  def show
    respond_to do |format|
      format.json { render json: @domain}
    end   
  end

  def update
    respond_to do |format|
      if @domain.update(domain_params)
        format.json { render json: @domain, status: :ok }
      else
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end   
  end

  def destroy
    respond_to do |format|
      if @domain.destroy
        format.json { render json: Domain.all, status: :ok }
      else
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end   
  end

  private
    def set_domain
      @domain = Domain.find(params[:id])
    end

    def domain_params
      params.require(:domain).permit(:id, :hostname)
    end    
end