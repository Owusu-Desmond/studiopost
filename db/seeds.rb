# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create!(full_name: 'Desmond Owusu Ansah', username: 'desmond', email: 'desmond0406114009@gmail.com', password: '123456', password_confirmation: '123456')

user2 = User.create!(full_name: 'Mike Okyere', username: 'mike', email: 'mikeokyere360@gmail.com', password: '654321', password_confirmation: '654321')

user3 = User.create!(full_name: 'John Doe', username: 'johndoe', email: 'johndoe@gmail.com', password: '123456', password_confirmation: '123456')

post1 = Post.create!(
    title: 'TechCrunch',
    text: '
    - [] **Main topics**: technology and startup news

    # What is TechCrunch?

    TechCrunch is a blog that provides technology and startup news, from the latest developments in Silicon Valley to venture capital funding.

    The blogs target audience is technology and business enthusiasts, especially startup founders and investors worldwide.

    ## History

    TechCrunch was founded in 2005 by Michael Arrington, who had previously worked as a reporter for the Wall Street Journal and CNET. The blog was initially funded by the venture capital firm Benchmark Capital, and was later acquired by AOL in 2005 for $30 million.

    In 2007, AOL sold TechCrunch to AOL co-founder Steve Case, who then sold it to AOL in 2008 for $25 million.

    ## What Can We Learn From This Blog

    The TechCrunch website’s clean layout prioritizes text readability with its simple white background and black text.

    Headlines of the most recent articles are shown neatly on the homepage and accompanied by snippets from the blog posts and relevant pictures to add a splash of color.

    The TechCrunch website also provides a helpful sidebar on the left side of the screen for easy navigation.

    ## Support

    If you like this blog, you can support it by subscribing to its newsletter or following it on social media.

    - [Twitter](https://twitter.com/TechCrunch)
    - [Facebook](https://www.facebook.com/TechCrunch/)
    - [LinkedIn](https://www.linkedin.com/company/techcrunch/)
    ',

    user_id: user1.id
)

post2 = Post.create!(
    title: 'What is the most popular programming language now?',
    text: '
    - [] **Main topics**: programming languages

    # What is the most popular programming language now?

    The most popular programming language in the world is JavaScript, according to the latest Stack Overflow Developer Survey.

    ## What is JavaScript?

    JavaScript is a programming language that is used to create interactive web pages and web applications.

    It is the most popular programming language in the world, with over 1.5 billion users.

    ## Why is JavaScript so popular?

    JavaScript is the most popular programming language in the world because it is easy to learn and use.

    Anyone can learn JavaScript in a few weeks, and it is used by millions of developers worldwide.

    ## Support

    If you like this blog, you can support it by subscribing to its newsletter or following it on social media.

    - [Twitter](https://twitter.com/mikeokyere360)
    - [Facebook](https://www.facebook.com/mikeokyere360/)
    - [LinkedIn](https://www.linkedin.com/in/mikeokyere360/)
    ',

    user_id: user2.id
)

post3 = Post.create!(
    title: 'Fist 10 most popular artists in the world',
    text: '
    - [] **Main topics**: music

    # Fist 10 most popular artists in the world

    The most popular artists in the world are:

    1. Taylor Swift
    2. Ed Sheeran
    3. Drake
    4. Ariana Grande
    5. Justin Bieber
    6. Shawn Mendes
    7. Billie Eilish
    8. Post Malone
    9. Khalid
    10. BTS

    ## Support

    If you like this blog, you can support it by subscribing to its newsletter or following it on social media.

    - [Twitter](https://twitter.com/johndoe)
    - [Facebook](https://www.facebook.com/johndoe/)
    - [LinkedIn](https://www.linkedin.com/in/johndoe/)
    ',
    user_id: user3.id
)

post4 = Post.create!(
    title: 'Reasons why I like Ruby on Rails for Backend Development',
    text: '
    - [] **Main topics**: Ruby on Rails

    # What is Ruby on Rails?

    Ruby on Rails is an open-source server-side web application framework with an MIT license. While Ruby on Rails is written in Ruby, a dynamic, general-purpose programming language from Japan; RoR is in fact a framework, not a language. Many entrepreneurs and non-developers often confuse the two, thinking Rails when hearing Ruby but rarely the other way around.
    
    ## Why I like Ruby on Rails

    A Rails developer can easily test features with a user base by developing a Minimum Viable Product (MVP). Developed in a matter of days, MVP ensures that the product is on track and is approved by the clients and the users.

    But this software development procedure of start-ups is often restricted by budget and time.
    
    Therefore, it is critical to search for the right Ruby on Rails development company that would function with the programming tools available.
    
    Below are a few reasons stating why RoR is good for creating an MVP:

    - **Speed**: Ruby on Rails is a fast framework that allows developers to create a web application in a matter of days. It is also easy to learn and use, which is why it is the most popular framework for startups.

    - **Security**: Ruby on Rails provides a secure environment for developers to create web applications. It also has a built-in security feature that protects the application from hackers and other threats.

    - **Scalability**: Ruby on Rails is a scalable framework that allows developers to create a web application that can be easily scaled up or down depending on the needs of the users.

    ## Support

    If you like this blog, you can support it by subscribing to its newsletter or following it on social media.

    - [Twitter](https://twitter.com/desmondowusudev)
    - [Facebook](https://www.facebook.com/desmondowusudev/)
    - [LinkedIn](https://www.linkedin.com/in/desmondowusudev/)
    ',
    user_id: user1.id
)


