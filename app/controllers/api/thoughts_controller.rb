class Api::ThoughtsController < ApplicationController

  def create
    @thought = Thought.new(
                            content: params[:content],
                            sentiment: params[:sentiment],
                            practice_id: params[:practice_id]
                            )
    @thought.save
  end

end
