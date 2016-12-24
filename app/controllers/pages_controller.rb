class PagesController < ApplicationController
  def index
  end

  def about
  end
  
  def contacts
  end

  def realcraft_190
    @boat = real_craft_190
  end

  def realcraft_200
    @boat = real_craft_200
  end
end
