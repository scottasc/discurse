class Api::ThoughtsController < ApplicationController

  def index
    @thoughts = Thought.all
    render 'index.json.jbuilder'
  end

  def create
    @thought = Thought.new(
                          content: params[:content],
                          practice_id: params[:practice_id]
                          )
    @thought.emotionalize
    @thought.colorize
    @thought.save
    render 'show.json.jbuilder'
  end

end
