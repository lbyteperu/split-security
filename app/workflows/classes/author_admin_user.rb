# frozen_string_literal: true

module Classes
  class AuthorAdminUser < Abstracts::AdminUser
    def build
      'owner admin user'
    end
  end
end
