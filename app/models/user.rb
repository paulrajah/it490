class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.search(search)
    if search
      where('LOWER(email) LIKE LOWER(?)', "%#{search}%")
    else
      scoped
    end
  end
end
