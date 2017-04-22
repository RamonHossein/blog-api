user = User.create(name: Faker::Lorem.name, email: "user@email.com", password: "pass1234")

50.times do
  post = Post.create(title: Faker::Lorem.word, content: Faker::Lorem.paragraph, created_by: user.id)
  post.comments.create(author: Faker::StarWars.character, content: Faker::Lorem.paragraph)
end
