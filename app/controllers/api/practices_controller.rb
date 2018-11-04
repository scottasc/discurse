class Api::PracticesController < ApplicationController

  def index
    @practices = Practice.where(user_id: current_user.id)
    render 'index.json.jbuilder'
  end

  def create
    @practice = Practice.new(user_id: current_user.id)
    @practice.save
    render "show.json.jbuilder"
  end

  def show
    @practice = Practice.find(user_id: current_user.id)
    render "show.json.jbuilder"
  end

  def update
    @practice = current_user.practices.last
    @practice.consolidate_thoughts
    @practice.save
    render "show.json.jbuilder"
  end

end
