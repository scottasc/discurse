class Api::WordsController < ApplicationController

  def index
    @words = Word.all
    render "index.json.jbuilder"
  end

end
