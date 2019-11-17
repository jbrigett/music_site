# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Userf', type: :request do
  #  Проверка невозможности добавления нового исполнителя, не залогинившись
  describe 'add user' do
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

    # Проверка регистрации нового пользователя
    it 'register new user and sign in' do
      visit new_user_registration_path
      s = rand(95..110).chr + 'alex666@gmail.com'
      fill_in :user_email, with: s
      fill_in :user_password, with: '4533267'
      fill_in :user_password_confirmation, with: '4533267'
      click_button 'Регистрация'
      current_path.should == '/'
    end
  end
end
