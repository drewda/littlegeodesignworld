class Question < ActiveRecord::Base
  belongs_to :person
  has_many :question_comments
end
