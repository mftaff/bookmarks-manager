4.times do
    seed_name = Faker::Name.first_name.downcase + rand(100..999).to_s
    seed_email = Faker::Internet.safe_email(seed_name)

    user = User.new(
        # username: seed_name,
        email: seed_email,
        # email_name: "",
        password: 'teatea',
        password_confirmation: 'teatea'
    )
    user.skip_confirmation!
    user.save!
end

admin_user = User.new(
        # username: "admin_user",
        email: 'admin@user.test',
        # email_name: 'admin',
        password: 'teatea',
        password_confirmation: 'teatea'
    )
admin_user.skip_confirmation!
admin_user.save!

users = User.all
flavors = ["Vanilla", "Chocolate", "Salted Caramel", "Butter Pecan", "Banana Chocolate Chip", "Apricot Noyaux", "Caramel Swirl", "Cherry Almond", "Coconut Pineapple", "Mint Fudge", "Mocha Almond Fudge", "Sea Salt Caramel with Toffee"]


15.times do 
    Topic.create(
        title: flavors.sample,
        user: users.sample
    )
end

topics = Topic.all

60.times do 
    topic = topics.sample
        
    Bookmark.create(
        url: Faker::Internet.url("#{topic.title.gsub(/[[:space:]]/, '').downcase}.flv"),
        topic: topic
    )
end

puts "Seed Complete"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
