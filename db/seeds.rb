# Users
diogo_almeida = User.new
diogo_almeida.name     = 'Diogo Almeida'
diogo_almeida.email    = 'diogo.almeida@gnomeslab.com'
diogo_almeida.password = 'gnomes1234'
diogo_almeida.save!
diogo_almeida.reload
diogo_almeida.encrypted_password  = '$2a$10$g0swLQhDbxiARNNwP7rWteYlA48QNOEIkBfmkUkzEFr/sWIhCTDJG'
diogo_almeida.password_salt       = '$2a$10$g0swLQhDbxiARNNwP7rWte'
diogo_almeida.save!

pedro_coutinho = User.new
pedro_coutinho.name = 'Pedro Coutinho'
pedro_coutinho.email = 'pedro.coutinho@gnomeslab.com'
pedro_coutinho.password = '123456'
pedro_coutinho.save!

miguel_teixeira          = User.new
miguel_teixeira.name     = 'Miguel Teixeira'
miguel_teixeira.email    = 'miguel.teixeira@gnomeslab.com'
miguel_teixeira.password = '123456'
miguel_teixeira.save!

# Development seed
if Rails.env == "development"
  # Blog posts
  Factory.create(:published_post)
  Factory.create(:post)
  
  # Comments
  5.times do
    Post.all.each { |p| Factory.create(:comment, :post => p) }
  end
end
