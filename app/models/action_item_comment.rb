class ActionItemComment < ActiveRecord::Base
  belongs_to :action_item
  belongs_to :person
end
