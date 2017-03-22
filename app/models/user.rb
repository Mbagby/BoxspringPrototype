class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
  enum user_type:[:employeer, :hr_manager]
  belongs_to :plan
  def name
    [first_name, last_name].join(' ')
  end
  def renew
    update_attibute :end_date, Date.today + 1.month
  end
end
