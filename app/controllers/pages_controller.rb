class PagesController < ApplicationController
  def index
  end

  def about
    @title = t(:about)
  end
  
  def contacts
    @title = t(:contacts)
  end

  def realcraft_190
    @boat = real_craft_190
    @title = @boat[:name]
  end

  def realcraft_200
    @boat = real_craft_200
    @title = @boat[:name]
  end
end
