# verification_script.rb
post = BlogPost.new(body: "word " * 400)
post.run_callbacks(:save)
puts "Expected reading time: 2"
puts "Actual reading time: #{post.reading_time}"

post2 = BlogPost.new(body: "word " * 100)
post2.run_callbacks(:save)
puts "Expected reading time: 1"
puts "Actual reading time: #{post2.reading_time}"
