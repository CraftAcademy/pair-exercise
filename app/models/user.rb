class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         
  has_many :posts

  validates_presence_of :first_name
  validates_presence_of :last_name

    def name
      [self.first_name, self.last_name].join(" ")
    end
end
