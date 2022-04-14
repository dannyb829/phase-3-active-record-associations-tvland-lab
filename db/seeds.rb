puts "seeding data..."
Actor.destroy_all
Show.destroy_all
Network.destroy_all
Character.destroy_all

Actor.reset_pk_sequence
Show.reset_pk_sequence
Network.reset_pk_sequence
Character.reset_pk_sequence

letters =['NBC','ABC','GBC','FGE','IFE','TBA']
genres = ['commedy','romance','action','thriller','horror']

6.times do
Network.create(call_letters:letters.sample, channel: rand(1..100))
end
50.times do
Actor.create(first_name:Faker::Name.first_name,last_name:Faker::Name.last_name)
Show.create(name:Faker::Movie.title,day: Date.today.to_s ,season:rand(1..6),genre: genres.sample , network: Network.all.sample)
end


500.times do
Character.create(name:Faker::Name.name,actor:Actor.all.sample,show:Show.all.sample,catchphrase:Faker::TvShows::Seinfeld.quote )
end

puts "seeding complete"