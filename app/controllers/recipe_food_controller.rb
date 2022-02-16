class RecipeFoodController < ApplicationController
  def index
    @foods = Food.all
  end
end
