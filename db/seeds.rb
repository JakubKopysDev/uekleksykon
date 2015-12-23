9.times do |n|
  title = "Foo Bar #{n+1}"
  content = "Donec turpis magna, rhoncus et metus eu, molestie auctor dolor. Ut sit amet massa dapibus, vestibulum leo in, malesuada elit. Pellentesque nec tortor velit. Praesent vitae ligula eget nunc consequat feugiat porttitor ut libero. Morbi hendrerit diam eget tortor suscipit scelerisque. Mauris facilisis, diam ac accumsan iaculis, est ligula semper tortor, sit amet bibendum neque est vitae ex. Etiam finibus elit felis, vitae tempus tortor vulputate eu. Nam mattis, ex dapibus faucibus sagittis, tellus arcu bibendum massa, sed aliquet est ligula quis justo. Donec vehicula neque eget bibendum suscipit. Praesent sit amet turpis placerat, tincidunt sapien id, aliquet ex. Morbi luctus lectus orci, ac eleifend magna placerat quis. Cras porttitor aliquam ex nec lacinia. In laoreet elementum augue, ac aliquet eros. "
  Post.create!(title: title, content: content)
end

100.times do |n|
  phrase = BetterLorem.w(2, true, true) + "- #{n}"
  explanation = BetterLorem.p(1, true, true)
  Term.create!(phrase: phrase, explanation: explanation)
end

Admin.create!(name: "admin", password: "foo14567bar")
