# frozen_string_literal: true

module Abstracts
  class AuthorUser
    def build
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
