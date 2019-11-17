# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'singers', type: :request do
  describe 'add singer' do
    let(:user) { build(:user) }
    it 'unable to add singer being log out' do
      visit '/'
      click_button('b1')
      p page.body
      fill_in :singer_name, with: 'Sting'
      def submit_form
        find('input[name="commit"]').click
      end
      submit_form
      current_path.should == '/users/sign_in'
    end
  end
end
