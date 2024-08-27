# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Factories::User::AuthorUserFactory do
  describe 'create author user' do
    context 'when author user is build' do
      it 'adds profile are assigned'
      it 'adds permissions are assigned'
      it 'has permissions to create articles'
      it 'has permissions to delete articles'
    end

    context 'when author user is save' do
      it 'creates an UUID for the user'
    end
  end
end
