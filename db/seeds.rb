user1 = User.create!(
  username: "bob",
  email: "bob@email.com",
  password: "password",
  about_me: "Hi, My name is Bob. I love to take pictures of Animals and Food. Hope you like my MoodBoards!!"
)

user2 = User.create!(
 username: "alice",
  email: "alice@email.com",
  password: "password",
  about_me: "Hello!! My name is Alice. Welcome to my MoodBoards!!"
)

MB1 = MoodBoard.create!(
    template: "Bubbles",
    published: true,
    global_rating: 2,
    featured: false,
    title: "My Mood is Good",
    user: user1
)

MB2 = MoodBoard.create!(
    template: "Bubbles",
    published: true,
    global_rating: 1,
    featured: false,
    title: "Happy Animals",
    user: user1
)

MB3 = MoodBoard.create!(
    template: "Bubbles",
    published: true,
    global_rating: 4,
    featured: false,
    title: "My Favorite Food",
    user: user2
)

MB4 = MoodBoard.create!(
    template: "Bubbles",
    published: true,
    global_rating: 5,
    featured: false,
    title: "Modern Architecture",
    user: user2
)

MB5 = MoodBoard.create!(
    template: "Bubbles",
    published: true,
    global_rating: 3,
    featured: true,
    title: "Color Theme",
    user: user2
)

P1 = Pin.create!(
    pin_name: "Plant",
    hovertext: "This is a plant.",
    mood_board: MB1
)

P1.image_file.attach(io: File.open(Rails.root.join("app/assets/images/plant.JPG")), filename: "plant.JPG", content_type: "image/jpeg")

P2 = Pin.create!(
    pin_name: "Cat",
    hovertext: "This is a cat.",
    mood_board: MB1
)

P2.image_file.attach(io: File.open(Rails.root.join("app/assets/images/cat.jpg")), filename: "cat.jpg", content_type: "image/jpeg")

P3 = Pin.create!(
    pin_name: "Leaves",
    hovertext: "Green Leaves.",
    mood_board: MB5
)

P3.image_file.attach(io: File.open(Rails.root.join("app/assets/images/Green1.jfif")), filename: "Green1.jfif", content_type: "image/jfif")

P4 = Pin.create!(
    pin_name: "Green Smoothie",
    hovertext: "A green smoothie?",
    mood_board: MB5
)

P4.image_file.attach(io: File.open(Rails.root.join("app/assets/images/green5.jpg")), filename: "green5.jpg", content_type: "image/jpeg")

P5 = Pin.create!(
    pin_name: "Trees",
    hovertext: "Pine Tree Forrest",
    mood_board: MB5
)

P5.image_file.attach(io: File.open(Rails.root.join("app/assets/images/green6.jfif")), filename: "green6.jfif", content_type: "image/jfif")

P6 = Pin.create!(
    pin_name: "Panda",
    hovertext: "Classic Panda",
    mood_board: MB2
)

P6.image_file.attach(io: File.open(Rails.root.join("app/assets/images/Panda.jfif")), filename: "Panda.jfif", content_type: "image/jfif")

P7 = Pin.create!(
    pin_name: "Owl",
    hovertext: "This is an owl.",
    mood_board: MB2
)

P7.image_file.attach(io: File.open(Rails.root.join("app/assets/images/Owl.jpg")), filename: "Owl.jpg", content_type: "image/jpeg")

P8 = Pin.create!(
    pin_name: "Weird Dog Thing",
    hovertext: "This is a weird dog thing.",
    mood_board: MB2
)

P8.image_file.attach(io: File.open(Rails.root.join("app/assets/images/Weird_dog_thing.jpg")), filename: "Weird_dog_thing.jpg", content_type: "image/jpeg")

P9 = Pin.create!(
    pin_name: "Plate House",
    hovertext: "This is a plate house.",
    mood_board: MB4
)

P9.image_file.attach(io: File.open(Rails.root.join("app/assets/images/Plate_house.jpg")), filename: "Plate_house.jpg", content_type: "image/jpeg")

P10 = Pin.create!(
    pin_name: "Opera House",
    hovertext: "This is an opera house.",
    mood_board: MB4
)

P10.image_file.attach(io: File.open(Rails.root.join("app/assets/images/Opera_house.jfif")), filename: "Opera_house.jfif", content_type: "image/jfif")

P11 = Pin.create!(
    pin_name: "Plant House",
    hovertext: "This is a plant house.",
    mood_board: MB4
)

P11.image_file.attach(io: File.open(Rails.root.join("app/assets/images/Plant_house.jfif")), filename: "Plant_house.jfif", content_type: "image/jfif")

P12 = Pin.create!(
    pin_name: "Pasta",
    hovertext: "This is pasta.",
    mood_board: MB3
)

P12.image_file.attach(io: File.open(Rails.root.join("app/assets/images/Pasta.jfif")), filename: "Pasta.jfif", content_type: "image/jfif")

P13 = Pin.create!(
    pin_name: "Tacos",
    hovertext: "This is Tacos.",
    mood_board: MB3
)

P13.image_file.attach(io: File.open(Rails.root.join("app/assets/images/Tacos.jpg")), filename: "Tacos.jpg", content_type: "image/jpeg")

P14 = Pin.create!(
    pin_name: "Waffles",
    hovertext: "This is a Waffles.",
    mood_board: MB3
)

P14.image_file.attach(io: File.open(Rails.root.join("app/assets/images/Waffles.jpg")), filename: "Waffles.jpg", content_type: "image/jpeg")

P15 = Pin.create!(
    pin_name: "Billie",
    hovertext: "Billie is green",
    mood_board: MB5
)

P15.image_file.attach(io: File.open(Rails.root.join("app/assets/images/Green3.jpg")), filename: "Green3.jpg", content_type: "image/jpeg")

P16 = Pin.create!(
    pin_name: "Lizard",
    hovertext: "This is a Lizard",
    mood_board: MB2
)

P16.image_file.attach(io: File.open(Rails.root.join("app/assets/images/Lizard.jfif")), filename: "Lizard.jfif", content_type: "image/jfif")

P17 = Pin.create!(
    pin_name: "Camel",
    hovertext: "This is a Camel",
    mood_board: MB2
)

P17.image_file.attach(io: File.open(Rails.root.join("app/assets/images/Camel.jfif")), filename: "Camel.jfif", content_type: "image/jfif")

P18 = Pin.create!(
    pin_name: "Kangaroo",
    hovertext: "This is a Kangaroo",
    mood_board: MB2
)

P18.image_file.attach(io: File.open(Rails.root.join("app/assets/images/Kangaroo.jpg")), filename: "Lizard.jpg", content_type: "image/jpeg")

P19 = Pin.create!(
    pin_name: "Rabbit",
    hovertext: "This is a Rabbit",
    mood_board: MB2
)

P19.image_file.attach(io: File.open(Rails.root.join("app/assets/images/Rabbit.jfif")), filename: "Rabbit.jfif", content_type: "image/jfif")

P20 = Pin.create!(
    pin_name: "Bear",
    hovertext: "This is a Bear",
    mood_board: MB2
)

P20.image_file.attach(io: File.open(Rails.root.join("app/assets/images/Bear.jpg")), filename: "Bear.jpg", content_type: "image/jpeg")

P21 = Pin.create!(
    pin_name: "Cookies",
    hovertext: "This is a Cookie",
    mood_board: MB2
)

P21.image_file.attach(io: File.open(Rails.root.join("app/assets/images/Cookies.jpg")), filename: "Cookies.jpg", content_type: "image/jpeg")

R1 = Rating.create!(
    like: false,
    mood_board: MB1,
    user: user1
)

C1 = Comment.create!(
    message: "Wow, this is looking really good!",
    mood_board: MB1,
    user: user1
)

C2 = Comment.create!(
    message: "Holy guacamole, so nice...!",
    mood_board: MB2,
    user: user1
)

C3 = Comment.create!(
    message: "I can't wait to make my own one of these.",
    mood_board: MB3,
    user: user2
)

C4 = Comment.create!(
    message: "10/10, would look at again.",
    mood_board: MB4,
    user: user2
)

C5 = Comment.create!(
    message: "PURE MOOOOOOOOOODS. (First)",
    mood_board: MB5,
    user: user2
)
