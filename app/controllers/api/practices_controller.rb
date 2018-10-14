class Api::PracticesController < ApplicationController

  def index
    @practices = Practice.where(user_id: current_user.id)
    render 'index.json.jbuilder'
  end

  def create
    @practice = Practice.new(user_id: current_user.id)
    @practice.save
  end

  def show
    @practice = Practice.find(params[:id])
    render "show.json.jbuilder"
  end

  def update
    @practice = Practice.last
    @practice.end_practice
    @practice.save
    render "show.json.jbuilder"
  end

end
