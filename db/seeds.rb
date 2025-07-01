puts "Creating users..."

[
  { email: "duparcrobin@gmail.com", password: "1946kitt" },
  { email: "ciaskious@gmail.com", password: "1946kitt" },
  { email: "joanagaalves@gmail.com", password: "1946kitt" },
  { email: "Sariel.nirn@gmail.com", password: "1946kitt" },
].each do |attrs|
  User.find_or_create_by!(email: attrs[:email]) do |user|
    user.password = attrs[:password]
  end
end

puts "Now creating vans..."

users = User.all
model_photo_map = {
  "Mercedes Vito" => ["db/seed_images/mercedes_vito_1.jpeg", "db/seed_images/mercedes_vito_2.jpeg"],
  "Volkswagen Crafter" => ["db/seed_images/vw_crafter_1.jpeg", "db/seed_images/vw_crafter_2.jpeg"],
  "Renault Trafic" => ["db/seed_images/renault_trafic_1.jpeg", "db/seed_images/renault_trafic_2.jpeg"],
  "Peugeot Expert" => ["db/seed_images/peugeot_expert_1.jpeg", "db/seed_images/peugeot_expert_2.jpeg"],
  "Renault Kangoo" => ["db/seed_images/renault_kangoo_1.jpeg", "db/seed_images/renault_kangoo_2.jpeg"],
}
seat_size_map = {
  2 => "small",
  4 => "medium",
  6 => "large",
  8 => "large",
}

10.times do |i|
  seats = seat_size_map.keys.sample
  size = seat_size_map[seats]
  model = model_photo_map.keys.sample
  van_img_path = model_photo_map[model].sample

  van = Van.create!(
    title: "Your dream Van Nr #{i}",
    description: "The perfect companion in your adventures",
    price: rand(80...160),
    model: model,
    seats: seats,
    size: size,
    user: users.sample,
  )

  van.photos.attach(
    io: File.open(Rails.root.join(van_img_path)),
    filename: File.basename(van_img_path),
    content_type: "image/jpeg",
  )

  puts "Created #{van.title} with #{seats} seats, size #{size}, for #{van.user.email}"
end
