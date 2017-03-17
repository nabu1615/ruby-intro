class Person < ActiveRecord::Base
	has_many :ratings, {:foreign_key => :judge_id}
	has_many :dogs, {:foreign_key => :owner_id}
  validates :first_name, :last_name, { :presence => true }
end
