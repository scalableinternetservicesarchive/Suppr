# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


N = 500000
NC = 10

users = []
dinners = []
comments = []

CONN = ActiveRecord::Base.connection
N.times do |i|
  uid = i + 1
  did = i + 1

  name = "user" + uid.to_s
  email = uid.to_s + "@email.com"

  users.push ("( '2014-12-11 23:26:42.610064','"  + email + "', '$2a$10$AkvE0Pr6NLJkg1z3B9RIP.wde1PAViWNm.oB0fgdaVbNwJz6zb.qu','" + name + "','" + name + "','2014-12-11 23:26:42.610064')")
  year = 2014
  dinners.push("('Chinese', '2014-12-11 23:26:42.610064', '" + year.to_s + "-12-11 23:26:42.610064', 'asdasdasd'," + uid.to_s + ", 'asd', 0, 2.0, 1, 1, 'asd', '2014-12-11 23:26:42.610064')")

    

    for j in 0..NC
      comments.push("('cantami o diva del pelide achille', '2014-12-11 23:26:42.610064', " + did.to_s + ", '2014-12-11 23:26:42.610064', "+ uid.to_s + ")")
   end

  
  if i % 500 == 0
      sql1 = "INSERT INTO users (`created_at`, `email`, `encrypted_password`, `first_name`, `last_name`, `updated_at`) VALUES #{users.join(", ")}"
    sql2 = "INSERT INTO dinners (`category`, `created_at`, `date`, `description`, `host_id`, `location`, `lock_version`, `price`, `seats`, `seats_available`, `title`, `updated_at`) VALUES #{dinners.join(", ")}"
    sql3 = "INSERT INTO comments (`content`, `created_at`, `dinner_id`, `updated_at`, `user_id`) VALUES #{comments.join(", ")}"
    
    CONN.execute sql1
    CONN.execute sql2
    CONN.execute sql3
    users = []
    dinners = []
    comments = []
  end
end

