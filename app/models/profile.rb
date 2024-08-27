# frozen_string_literal: true

#
#
#
#  a profile might be :
#   * administrator
#   * admin
#   * author
#   * regular_user
#   * super_admin
#   * custom_profile

class Profile < ApplicationRecord
  self.table_name = 'profiles'
  include ActiveModel::Validations

  belongs_to :work_group, class_name: 'WorkGroup'
  has_many :user_profiles, class_name: 'UserProfile', dependent: :destroy
  has_many :users, through: :user_profiles, class_name: 'User'

  validates :title, presence: true, uniqueness: true
  validates_with ProfileValidator

  def active?
    is_active
  end

  def root?
    is_root && parent_id.nil?
  end

  def child?
    !is_root && parent_id.present?
  end
end
