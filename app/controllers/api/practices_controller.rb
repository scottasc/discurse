class Api::PracticesController < ApplicationController

  def index
    @practices = Practice.all
    render 'index.json.jbuilder'
  end

  def create
    @practice = Practice.new(
                            user_id: params[:user_id]
                            )
    @practice.save
  end

  def show
    @practice = Practice.find(params[:id])
    render "show.json.jbuilder"
  end

  def update
    @practice = Practice.last
    @practice.end_practice
    render 'show.json.jbuilder'
  end

end
