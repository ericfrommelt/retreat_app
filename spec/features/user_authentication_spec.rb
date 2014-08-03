require 'rails_helper'

describe 'User Authentication', js: true do

  it 'should start on a page that has a log In and sign up button' do
    visit root_path
    expect(page).to have_content 'Sign Up'
    expect(page).to have_content 'Log In'
  end

  it 'should produce a model when Log In is clicked' do
    visit root_path
    click_link 'Log In'

    login_modal = find 'session-modal'

    expect(login_modal).to have_content 'Log In'

  end

  it 'should allow a user to login' do
    User.create!(email: 'test@example.com', password: 'qwertyui', image_url: 'blah', password_confirmation: 'qwertyui', first_name: 'tester', last_name: 'one')

    visit root_path
    click_link 'Log In'

    within('#login-modal') do
      fill_in 'email-text', with: 'test@example.com'
      fill_in 'password-text', with: 'qwertyui'
    end

    click_button 'Log In'

    expect(page).to have_content 'Tester'
  end
end
