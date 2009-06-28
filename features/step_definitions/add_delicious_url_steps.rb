Dado /^que soy admin$/ do
  Dado 'que estoy en la página de login'
  Y "relleno 'login' con '#{PLANETOID_CONF[:admin][:login]}'"
  Y "relleno 'password' con '#{PLANETOID_CONF[:admin][:password]}'"
  Y 'presiono "Login"'
end

Dado /^que existe existe un miembro (.*)$/ do |user_name|
  @member = Factory.create(:user, :name => user_name)
end

Entonces /^el delicious_user de '(.*)' debería ser '(.*)'$/ do |user_name, delicious_user|
  @member = User.find(user_name)
  @member.delicious_user == delicious_user
end


# Por defecto

Given /^the following add_delicious_urls:$/ do |add_delicious_urls|
  AddDeliciousUrl.create!(add_delicious_urls.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) add_delicious_url$/ do |pos|
  visit add_delicious_urls_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following add_delicious_urls:$/ do |add_delicious_urls|
  add_delicious_urls.rows.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      response.should have_selector("table > tr:nth-child(#{i+2}) > td:nth-child(#{j+1})") { |td|
        td.inner_text.should == cell
      }
    end
  end
end
