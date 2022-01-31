class Login
  #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
  include Capybara::DSL

  def visit_Login_NewAccess
    visit 'https://autoteste.dimep-ams.com.br/'
  end

  # def receive_Correct_Pass
  #   puts 'Digite a senha do usuário "admin": '
  #   correctPass = $stdin.gets.strip
   
  #   return correctPass.to_s
  # end

  def make_Login
    fill_in      'txtUsrLogin',      with: 'admin'
    fill_in      'txtUserPassLogin', with: $passwordAdmin
    click_button 'Submit1'
  end
end 