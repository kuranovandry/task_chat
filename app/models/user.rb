class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:nickname]

  has_many :workers, dependent: :destroy
  has_many :comments, dependent: :destroy

  def email_required?
    false
  end

  def email_changed?
    false
  end

end
