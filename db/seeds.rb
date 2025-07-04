require "open-uri"

User.destroy_all
Van.destroy_all

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
  "Mercedes Vito" => ["https://res.cloudinary.com/djls9crmj/image/upload/v1751479020/oq3ubp0i0iojetgtistz.jpg", "https://res.cloudinary.com/djls9crmj/image/upload/v1751479083/sfacszl6ptacjrsfd4zb.jpg"],
  "Volkswagen Crafter" => ["https://res.cloudinary.com/djls9crmj/image/upload/v1751479177/vw_crafter_1_ozlw2i.jpg", "https://res.cloudinary.com/djls9crmj/image/upload/v1751479177/vw_crafter_2_dohzss.jpg"],
  "Renault Trafic" => ["https://res.cloudinary.com/djls9crmj/image/upload/v1751479177/renault_trafic_1_pg0qpr.jpg", "https://res.cloudinary.com/djls9crmj/image/upload/v1751479177/renault_trafic_2_xnlmbd.jpg"],
  "Peugeot Expert" => ["https://res.cloudinary.com/djls9crmj/image/upload/v1751479104/omoo932emrt30mvqifgs.jpg", "https://res.cloudinary.com/djls9crmj/image/upload/v1751479119/gac1bquiaxnatq8vsgj3.jpg"],
  "Renault Kangoo" => ["https://res.cloudinary.com/djls9crmj/image/upload/v1751479177/renault_kangoo_1_zjyhsm.jpg", "https://res.cloudinary.com/djls9crmj/image/upload/v1751479177/renault_kangoo_2_wosc8x.jpg"],
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
  van_img_url = model_photo_map[model].sample

  van = Van.create!(
    title: "Your dream Van Nr #{i}",
    description: "The perfect companion in your adventures",
    price: rand(80...160),
    model: model,
    seats: seats,
    size: size,
    user: users.sample,
  )

  file = URI.open(van_img_url)
  van.photos.attach(io: file, filename: File.basename(URI.parse(van_img_url).path), content_type: "image/jpeg")
  puts "Created #{van.model} #{van.title} with #{seats} seats, size #{size}, for #{van.user.email}"
end
