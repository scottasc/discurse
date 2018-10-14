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

    @thought.split_words
    @thought.emotionalize
    @thought.save
    render 'show.json.jbuilder'
  end

end
