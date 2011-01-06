class SiteController < ApplicationController
  def land
    @questions = Question.all(:order => "votes DESC")
    @action_items = ActionItem.all(:order => "votes DESC")
  end
end