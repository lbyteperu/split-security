# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable

  include DeviseTokenAuth::Concerns::User
  before_validation :set_uid

  PASSWORD_REQUIREMENTS = /\A
    (?=.{8,})
    (?=.*\d)
    (?=.*[a-z])
    (?=.*[A-Z])
    (?=.*[[:^alnum:]])
  /x

  has_many :user_profiles, class_name: 'UserProfile', dependent: :destroy
  has_many :profiles, through: :user_profiles, class_name: 'Profile'

  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
  validates :password, length: { in: 8..128 }
  validates :password,
            format: { with: PASSWORD_REQUIREMENTS,
                      message: I18n.t(:message_strong_password) }

  private

  def set_uid
    self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
  end
end
