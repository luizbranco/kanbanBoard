Given /^I sign up$/ do
  visit signup_path
  fill_in 'Name', :with => 'Luiz Branco'
  fill_in 'Email', :with => 'artfikan@gmail.com'
  fill_in 'Password', :with => 'secret'
  fill_in 'Password confirmation', :with => 'secret'
  click_on 'Sign Up'
end

Given /^I have an user account$/ do
  @user = Factory(:user)
end

Given /^I'm logged in$/ do
  steps %{
    Given I have an user account
    When I log in
  }
end

When /^I log in$/ do
  visit login_path
  fill_in 'Email', :with => @user.email
  fill_in 'Password', :with => 'secret'
  click_on 'Login'
  page.should have_content 'Logged in!'
end

When /^I log out$/ do
  click_on 'Log out'
  page.should have_content 'You\'ve logged out!'
end

Then /^I should be signed up$/ do
  page.should have_content 'Signed up!'
end

Then /^I should access the site and its projects$/ do
  page.should have_content 'Projects'
end

Then /^I should not access the site and its projects$/ do
  page.should have_content 'Login'
end
