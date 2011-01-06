class ActionItem < ActiveRecord::Base
  belongs_to :person
  has_many :action_item_comments
  has_many :people_whove_taken_on, :source => :person, :through => :person_taking_on_action_items
  has_many :person_taking_on_action_items
end
