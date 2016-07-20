class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  invisible_captcha only: [:contact], honeypot: :topic

  def index
  	@schedule = [
  		{time: '9:00 am',  length: '60 minutes', title: 'Registration, Continental Breakfast, Games/Demos'},
  		{time: '10:00 am', length: '5 minutes',  title: 'Opening/Kickoff'},
  		{time: '10:05 am', length: '35 minutes', title: 'Dave Thomas (pragdave.me)'},
  		{time: '10:45 am', length: '15 minutes', title: 'Community Spotlight: Jackie Ros (Revolar)'},
  		{time: '11:05 am', length: '35 minutes', title: 'Erika Carlson (Detroit Labs)'},
  		{time: '11:45 am', length: '35 minutes', title: 'Kinsey Ann Durham (GoSpotCheck)'},
  		{time: '12:25 pm', length: '35 minutes', title: 'Ingrid Alongi (Cognizant Quick Left)'},
  		{time: '1:00 pm',  length: '60 minutes', title: 'Lunch'},
  		{time: '2:00 pm',  length: '5 minutes',  title: 'Reconvene'},
  		{time: '2:05 pm',  length: '25 minutes', title: 'Sarah Allen (18F)'},
  		{time: '2:35 pm',  length: '15 minutes', title: 'Community Spotlight: Wan-Lae Cheng (Skillful / Markle Foundation)'},
      {time: '2:55 pm',  length: '35 minutes', title: 'Chad Fowler (Wunderlist / Microsoft)'},
      {time: '3:35 pm',  length: '35 minutes', title: 'Saron Yitbarek (CodeNewbie)'},
      {time: '4:15 pm',  length: '15 minutes', title: 'Thanks & Closing'},
      {time: '4:30 pm',  length: '90 minutes', title: 'Happy Hour (Sharpe Lobby)'}
  	]

    @speakers = [
      {name: 'Dave Thomas',   bio: 'Dave opened Ruby to the English-speaking world with his book "Programming Ruby" and changed thousands of careers with "The Pragmatic Programmer". From there, he co-founded The Pragmatic Bookshelf publishing company which has gone on to publish the top-choice books for dozens of technologies. Dave has spent hundreds of hours coaching other developers in the classroom and on the job.', img: 'speakers/dave-thomas.jpg'},
      {name: 'Ingrid Alongi', bio: 'Ingrid is a software engineer with experience in both interactive agencies and venture-funded start ups. She founded Quick Left, a software development company, which was acquired by Cognizant in 2016. With deep roots in the Colorodo technology community and many years experience as both a developer and leader, Ingrid is always interested in exploring the intersection of technology and human connection.', img: 'speakers/ingrid-alongi.jpg'},
      {name: 'Erika Carlson', bio: 'Erika Carlson was studying clinical psychology in 2011, when she wrote her first line of Python code. She fell in love with programming, decided to change paths, and is now a software developer and director of the Developer Apprentice Program at Detroit Labs. Erika is deeply passionate about creating a community of peers and mentors for women exploring the field of technology for the first time.', img: 'speakers/erika-carlson.jpg'},
      # {name: 'Dave Thomas', bio: 'Kinsey is a software engineer at GoSpotCheck in Denver, Colorado. She is the co-founder of Kubmo, a non-profit dedicated to building and teaching technology curriculum to young women around the world. She is the chair of the BridgeFoundry board and organizes the Scholars and Guides Programs for Ruby Central conferences. She is also obsessed with dogs, especially her dog Harleigh.', img: 'default-speaker.jpg'},
      # {name: 'Dave Thomas', bio: 'Kinsey is a software engineer at GoSpotCheck in Denver, Colorado. She is the co-founder of Kubmo, a non-profit dedicated to building and teaching technology curriculum to young women around the world. She is the chair of the BridgeFoundry board and organizes the Scholars and Guides Programs for Ruby Central conferences. She is also obsessed with dogs, especially her dog Harleigh.', img: 'default-speaker.jpg'},
      # {name: 'Dave Thomas', bio: 'Kinsey is a software engineer at GoSpotCheck in Denver, Colorado. She is the co-founder of Kubmo, a non-profit dedicated to building and teaching technology curriculum to young women around the world. She is the chair of the BridgeFoundry board and organizes the Scholars and Guides Programs for Ruby Central conferences. She is also obsessed with dogs, especially her dog Harleigh.', img: 'default-speaker.jpg'},
      # {name: 'Dave Thomas', bio: 'Kinsey is a software engineer at GoSpotCheck in Denver, Colorado. She is the co-founder of Kubmo, a non-profit dedicated to building and teaching technology curriculum to young women around the world. She is the chair of the BridgeFoundry board and organizes the Scholars and Guides Programs for Ruby Central conferences. She is also obsessed with dogs, especially her dog Harleigh.', img: 'default-speaker.jpg'},
      # {name: 'Dave Thomas', bio: 'Kinsey is a software engineer at GoSpotCheck in Denver, Colorado. She is the co-founder of Kubmo, a non-profit dedicated to building and teaching technology curriculum to young women around the world. She is the chair of the BridgeFoundry board and organizes the Scholars and Guides Programs for Ruby Central conferences. She is also obsessed with dogs, especially her dog Harleigh.', img: 'default-speaker.jpg'},
      # {name: 'Dave Thomas', bio: 'Kinsey is a software engineer at GoSpotCheck in Denver, Colorado. She is the co-founder of Kubmo, a non-profit dedicated to building and teaching technology curriculum to young women around the world. She is the chair of the BridgeFoundry board and organizes the Scholars and Guides Programs for Ruby Central conferences. She is also obsessed with dogs, especially her dog Harleigh.', img: 'default-speaker.jpg'}
    ]

    @sponsors = [
      'sponsor-default.jpg',
      'sponsor-default.jpg',
      'sponsor-default.jpg'
    ]

    @vendors = [
      'vendor-default.jpg',
      'vendor-default.jpg',
      'vendor-default.jpg'
    ]
  end

  def contact
    ContactMailer.form_request(params[:name], params[:email], params[:comment]).deliver_now
    render text: 'Message sent successfully. Thank you.', status: 200
  end
end
