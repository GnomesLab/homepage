# Users
diogo_almeida = User.new
diogo_almeida.name     = 'Diogo Almeida'
diogo_almeida.email    = 'diogo.borges.almeida@gmail.com'
diogo_almeida.password = 'gnomes1234'
diogo_almeida.save!
diogo_almeida.reload
diogo_almeida.encrypted_password  = '$2a$10$g0swLQhDbxiARNNwP7rWteYlA48QNOEIkBfmkUkzEFr/sWIhCTDJG'
diogo_almeida.password_salt       = '$2a$10$g0swLQhDbxiARNNwP7rWte'
diogo_almeida.save!

pedro_coutinho = User.new
pedro_coutinho.name = 'Pedro Coutinho'
pedro_coutinho.email = 'pdcoutinho@gmail.com'
pedro_coutinho.password = '111111'
pedro_coutinho.save!

miguel_teixeira          = User.new
miguel_teixeira.name     = 'Miguel Teixeira'
miguel_teixeira.email    = 'miguelfteixeira@gmail.com'
miguel_teixeira.password = '1234567'
miguel_teixeira.save!

# Projects
if Rails.env == "development"
  2.times do
    c = Factory.create(:category)
    6.times do
      p = Factory.create(:project, :category => c)
      2.times { Factory.create(:image, :project => p) }
    end
  end
end

# Posts (blog)
if Rails.env == "development"
  10.times { Factory.create(:post) }
end