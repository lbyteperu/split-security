# frozen_string_literal: true

module Abstracts
  class User
    def create_basic_user
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    def create_admin_user
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
