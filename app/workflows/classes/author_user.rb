# frozen_string_literal: true

module Classes
  class AuthorUser < Abstracts::AuthorUser
    def build
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
