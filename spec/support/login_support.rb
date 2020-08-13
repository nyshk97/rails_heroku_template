module LoginSupport
  def sign_in_as(user)
    visit login_path
    find(:test_id, 'email').set(user.email)
    find(:test_id, 'password').set(user.password)
    find(:test_id, 'submit').click
  end
end
