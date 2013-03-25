class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  # attr_accessible :title, :body
end
