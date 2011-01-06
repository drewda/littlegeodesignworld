class PersonTakingOnActionItem < ActiveRecord::Base
  belongs_to :person
  belongs_to :action_item
end
