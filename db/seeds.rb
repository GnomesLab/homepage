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