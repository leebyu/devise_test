class User < ApplicationRecord
  rolify
  # make current_user.can_update? // current_user.can_delete? method available
  include Authority::UserAbilities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts, dependent: :destroy
  devise(:database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable)

  after_create(:set_default_role, if: Proc.new{ User.count > 1} )

  private
    def set_default_role
      add_role(:user)
    end
end
