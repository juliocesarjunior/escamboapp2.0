namespace :utils do

  #################################################################
  desc "Cria Administradores Fake"
  task generate_admins: :environment do
    puts "CRIANDO ADMINISTRADORES..."

    10.times do
      Admin.create!(
        # name: Faker::Name.name,
        email: Faker::Internet.email, 
        password: "1234567890", 
        password_confirmation: "1234567890",
        # role: [0,0,1,1,1].sample
        )
    end

    puts "ADMINISTRADORES CADASTRADO COM SUCESSO!"
  end
#################################################################

end
