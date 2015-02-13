class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :messages
  has_many :subscriptions
  has_many :workouts
  acts_as_mappable :default_units => :miles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
