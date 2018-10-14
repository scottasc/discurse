class Api::PracticesController < ApplicationController

  def index
    @practices = Practice.where(user_id: params[:user_id])
    @total_practices = @practices.count
    @total_thoughts = 0
    @practices.each do |p|
      @total_thoughts += p.thought_count
    end
    @average_thoughts_per_session = (@total_thoughts.to_f/@total_practices.to_f).round(2)
    render 'index.json.jbuilder'
  end

  def create
    @practice = Practice.new(user_id: current_user.id)
    @practice.save
    render "show.json.jbuilder"
  end

  def show
    @practice = Practice.find(params[:id])
    render "show.json.jbuilder"
  end

  def update
    @practice = Practice.find(params[:id])
    @practice.end_practice
    @practice.save
    render "show.json.jbuilder"
  end

end
