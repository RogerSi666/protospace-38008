class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :prototype

  validates :text, presence: true 

end
