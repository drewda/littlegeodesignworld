class Person < ActiveRecord::Base
  has_many :questions
  has_many :question_comments
  has_many :action_item_comments
  has_many :person_taking_on_action_items
  has_many :action_items, :through => :person_taking_on_action_items
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :last_name, :bioblurb, :first_name, :longitude, :latitude
  
  def name
    if self.first_name and self.last_name
      self.first_name + " " + self.last_name
    else
      self.email
    end
  end
end
