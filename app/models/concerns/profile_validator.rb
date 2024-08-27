# frozen_string_literal: true

class ProfileValidator < ActiveModel::Validator
  def validate(record)
    return unless record[:is_root].present? && record[:parent_id].present?

    record.errors.add(:is_root, "can't have parent_id if root profile")
  end
end
