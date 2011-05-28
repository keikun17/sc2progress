class StrategiesController < ApplicationController
  def index
    @strategies = Strategy.all
  end

  def show
    @strategy = Strategy.find(params[:id])
  end

  def new
    @strategy = Strategy.new
  end

  def create
    @strategy = Strategy.new(params[:strategy])
    if @strategy.save
      redirect_to @strategy, :notice => "Successfully created strategy."
    else
      render :action => 'new'
    end
  end

  def edit
    @strategy = Strategy.find(params[:id])
  end

  def update
    @strategy = Strategy.find(params[:id])
    if @strategy.update_attributes(params[:strategy])
      redirect_to @strategy, :notice  => "Successfully updated strategy."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @strategy = Strategy.find(params[:id])
    @strategy.destroy
    redirect_to strategies_url, :notice => "Successfully destroyed strategy."
  end
end
