User.destroy_all
FriendRequest.destroy_all
Getaway.destroy_all
GetawayPhoto.destroy_all
Friendship.destroy_all

User.create!(email: "najee_gardner@me.com", password: "qwerty123", password_confirmation: "qwerty123", first_name: "Najee", last_name: "Gardner")
User.create!(email: "gadigottlieb@gmail.com", password: "qwerty123", password_confirmation: "qwerty123", first_name: "Gadi", last_name: "Gottlieb")
User.create!(email: "lucypine@gmail.com", password: "qwerty123", password_confirmation: "qwerty123", first_name: "Lucy", last_name: "Pine")
User.create!(email: "craigdougly@gmail.com", password: "qwerty123", password_confirmation: "qwerty123", first_name: "Craig", last_name: "Dougly")
User.create!(email: "pikachu@gmail.com", password: "qwerty123", password_confirmation: "qwerty123", first_name: "Pika", last_name: "Chu")
User.create!(email: "marymiles@gmail.com", password: "qwerty123", password_confirmation: "qwerty123", first_name: "Mary", last_name: "Miles")

najee_getaways = [
  {city: 'New York', country: 'NY', departure_date: '2014-07-23', comment: 'I was born and raised here. Don\'t ever doubt my knowledge, son! I know the ins and the outs. The ups and the downs. Don\'t test me.', user_id: User.find_by(email: 'najee_gardner@me.com').id},
  {city: 'Los Angeles', country: 'CA', departure_date: '2013-04-12', comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet nibh eget lectus venenatis, sit amet luctus arcu convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', user_id: User.find_by(email: 'najee_gardner@me.com').id},
  {city: 'San Francisco', country: 'CA', departure_date: '2013-04-20', comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet nibh eget lectus venenatis, sit amet luctus arcu convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', user_id: User.find_by(email: 'najee_gardner@me.com').id},
  {city: 'Osaka', country: 'Japan', departure_date: '2012-11-04', comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet nibh eget lectus venenatis, sit amet luctus arcu convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', user_id: User.find_by(email: 'najee_gardner@me.com').id},
  {city: 'Paris', country: 'France', departure_date: '2010-02-16', comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet nibh eget lectus venenatis, sit amet luctus arcu convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', user_id: User.find_by(email: 'najee_gardner@me.com').id}
]

gadi_getaways = [
  {city: 'Florence', country: 'Italy', departure_date: '2014-07-23', comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet nibh eget lectus venenatis, sit amet luctus arcu convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', user_id: User.find_by(email: 'gadigottlieb@gmail.com').id},
  {city: 'Orlando', country: 'FL', departure_date: '2013-04-12', comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet nibh eget lectus venenatis, sit amet luctus arcu convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', user_id: User.find_by(email: 'gadigottlieb@gmail.com').id},
  {city: 'San Francisco', country: 'CA', departure_date: '2013-04-20', comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet nibh eget lectus venenatis, sit amet luctus arcu convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', user_id: User.find_by(email: 'gadigottlieb@gmail.com').id},
  {city: 'Cancun', country: 'Mexico', departure_date: '2012-11-04', comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet nibh eget lectus venenatis, sit amet luctus arcu convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', user_id: User.find_by(email: 'gadigottlieb@gmail.com').id},
  {city: 'Paris', country: 'France', departure_date: '2010-02-16', comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet nibh eget lectus venenatis, sit amet luctus arcu convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', user_id: User.find_by(email: 'gadigottlieb@gmail.com').id}
]

Getaway.create!(city: 'Osaka', country: 'Japan', departure_date: '2014-07-23', comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet nibh eget lectus venenatis, sit amet luctus arcu convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', user_id: User.find_by(email: 'lucypine@gmail.com').id)
Getaway.create!(city: 'San Francisco', country: 'CA', departure_date: '2013-04-20', comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet nibh eget lectus venenatis, sit amet luctus arcu convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', user_id: User.find_by(email: 'craigdougly@gmail.com').id)
Getaway.create!(city: 'Paris', country: 'France', departure_date: '2010-02-16', comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam aliquet nibh eget lectus venenatis, sit amet luctus arcu convallis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', user_id: User.find_by(email: 'pikachu@gmail.com').id)


najee_getaways.each_with_index do |getaway, index|
  Getaway.create!(getaway)
  Getaway.create!(gadi_getaways[index])
end

orlando = Getaway.find_by(city: 'Orlando')
new_york_city = Getaway.find_by(city: 'New York')

disney_world = [
  {name: 'Walt Disney World', comment: 'There aren\'t enough words to describe the wonderously magical experiences that are born in this place. I had the greatest time of my life. I can\'t even right now.', category: 'play' , image_url: 'http://images.fineartamerica.com/images-medium-large/palm-tree-silhouettes-sunset-waikiki-natural-selection-craig-tuttle.jpg', getaway_id: orlando.id},
  {name: 'Space Mountain', comment: 'Tears form when someone even utters the name of this amazing ride. A must try.', category: 'play' , image_url: 'http://images.fineartamerica.com/images-medium-large/palm-tree-silhouettes-sunset-waikiki-natural-selection-craig-tuttle.jpg', getaway_id: orlando.id},
  {name: 'Wishes Fireworks Show', comment: 'Speaking of tears, have you seen Wishes at the Magic Kingdom? I don\'t even think I can express to you the emotions that go through me when I watch this show.', category: 'play' , image_url: 'http://images.fineartamerica.com/images-medium-large/palm-tree-silhouettes-sunset-waikiki-natural-selection-craig-tuttle.jpg', getaway_id: orlando.id},
  {name: 'Tony\'s', comment: 'Good Eats! Some great Italian food here. This Lady and the Tramp themed restaurant is one that I will visit everytime I come.', category: 'eat' , image_url: 'http://images.fineartamerica.com/images-medium-large/palm-tree-silhouettes-sunset-waikiki-natural-selection-craig-tuttle.jpg', getaway_id: orlando.id},
  {name: 'Liberty Tree Tavern', comment: 'Can\'t beat an all you can eat Thanks Giving dinner all year round. They have turkey, mashed potatoes and all that other Thanks Giving stuff. Delicious.', category: 'eat' , image_url: 'http://images.fineartamerica.com/images-medium-large/palm-tree-silhouettes-sunset-waikiki-natural-selection-craig-tuttle.jpg', getaway_id: orlando.id},
  {name: 'Sci-fi Diner', comment: 'The burger\'s aren\'t so great here. But there are definitely some really good milkshakes here.', category: 'eat' , image_url: 'http://images.fineartamerica.com/images-medium-large/palm-tree-silhouettes-sunset-waikiki-natural-selection-craig-tuttle.jpg', getaway_id: orlando.id},
  {name: 'Animal Kingdom Lodge', comment: 'Have you ever woken up, walked out onto the terrace to greet a giraffe? Yea, that happens here.', category: 'stay' , image_url: 'http://images.fineartamerica.com/images-medium-large/palm-tree-silhouettes-sunset-waikiki-natural-selection-craig-tuttle.jpg', getaway_id: orlando.id},
  {name: 'Arts and Animation Resort', comment: 'If you like disney animations, this resort has some really cool themed rooms.', category: 'stay' , image_url: 'http://images.fineartamerica.com/images-medium-large/palm-tree-silhouettes-sunset-waikiki-natural-selection-craig-tuttle.jpg', getaway_id: orlando.id}
]

new_york = [
  {name: 'Staten Island Ferry', comment: 'This is such a calming ride for me. I love to hang out on the deck and just look out into the world.', category: 'play' , image_url: 'http://images.fineartamerica.com/images-medium-large/palm-tree-silhouettes-sunset-waikiki-natural-selection-craig-tuttle.jpg', getaway_id: new_york_city.id},
  {name: 'The Marriot Hotel', comment: 'Such good customer service. Definitely enjoyed running around the hotel with my socks on. Those carpets are so soft.', category: 'stay' , image_url: 'http://images.fineartamerica.com/images-medium-large/palm-tree-silhouettes-sunset-waikiki-natural-selection-craig-tuttle.jpg', getaway_id: new_york_city.id},
  {name: 'Jin Ramen', comment: 'Nice little Ramen shop. Try the Gyudon (beef and rice bowl). It is delicious', category: 'eat' , image_url: 'http://images.fineartamerica.com/images-medium-large/palm-tree-silhouettes-sunset-waikiki-natural-selection-craig-tuttle.jpg', getaway_id: new_york_city.id}
]

disney_world.each do |activity|
  Activity.create!(activity)
end

new_york.each do |activity|
  Activity.create!(activity)
end
