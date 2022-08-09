class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :occupation, presence: true
         validates :position, presence: true
         validates :name, presence: true
         validates :profile, presence: true
         has_many :prototypes
         has_many :comments
end
