class Api::ThoughtsController < ApplicationController

  def index
    @thoughts = Thought.all
    render 'index.json.jbuilder'
  end

  def create
    @thought = Thought.new(
                          content: params[:content],
                          practice_id: current_user.practices.last.id
                          )
    @thought.emotionalize
    @thought.colorize
    @thought.rgb_to_xy
    @thought.save
    render 'show.json.jbuilder'
  end

end
