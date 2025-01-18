class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
          :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

         has_many :documents, dependent: :destroy

  enum role: { regular: 0, admin: 1 }

  validates :role, :email, :password, :name, presence: true
end
