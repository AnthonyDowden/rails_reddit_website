# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if User.find(1).nil?
	@user = User.create(
		{
			email: 'a.dowden@outlook.com',
			password: '123456',
			password_confirmation: '123456'
		}
	)
else
	@user = User.find(1)
end

if Community.all.count < 1 || true
	Community.destroy_all

	community_data = [
		{
			name: 'World of Warcraft',
			description: '',
			slug: 'world-of-warcraft',
			user_id: @user.id
		},
		{
			name: 'Call of Duty',
			description: '',
			slug: 'call-of-duty',
			user_id: @user.id
		},
		{
			name: 'Warhammer',
			description: '',
			slug: 'warhammer',
			user_id: @user.id
		},
		{
			name: "Player Unknown's Battlegrounds",
			description: '',
			slug: 'pubg',
			user_id: @user.id
		},
	]

	posts_data = {
		"world-of-warcraft" => [
			{
				title: 'Classic Wow release date',
				content: '',
				slug: 'classic-wow-release-date',
				user_id: @user.id
			},
			{
				title: 'How to play a priest',
				content: '',
				slug: 'how-to-play-a-priest',
				user_id: @user.id
			}
		]
	}

	community_data.each do |cd|
		community = Community.create(cd)
		next unless posts_data[community.slug]

		posts_data[community.slug].each do |post|
			post = community.posts.build(post)
			post.save!
		end

	end
end