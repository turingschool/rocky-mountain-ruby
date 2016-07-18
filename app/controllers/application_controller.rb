class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  invisible_captcha only: [:contact], honeypot: :topic

  def index
  	@schedule = [
  		{time: '8:00 am', length: '60 minutes', title: 'Registration, Coffee, Games/Demos'},
  		{time: '9:00 am', length: '30 minutes', title: 'Registration, Coffee, Games/Demos'},
  		{time: '10:30 am', length: '60 minutes', title: 'Registration, Coffee, Games/Demos'},
  		{time: '11:00 am', length: '30 minutes', title: 'Registration, Coffee, Games/Demos'},
  		{time: '11:15 am', length: '90 minutes', title: 'Registration, Coffee, Games/Demos'},
  		{time: '12:00 pm', length: '45 minutes', title: 'Registration, Coffee, Games/Demos'},
  		{time: '1:00 pm', length: '60 minutes', title: 'Registration, Coffee, Games/Demos'},
  		{time: '1:45 pm', length: '90 minutes', title: 'Registration, Coffee, Games/Demos'},
  		{time: '2:00 pm', length: '90 minutes', title: 'Registration, Coffee, Games/Demos'},
  		{time: '2:30 pm', length: '60 minutes', title: 'Registration, Coffee, Games/Demos'},
  		{time: '3:00 pm', length: '30 minutes', title: 'Registration, Coffee, Games/Demos'}
  	]

    @speakers = [
      {name: 'Dave Thomas', bio: 'Kinsey is a software engineer at GoSpotCheck in Denver, Colorado. She is the co-founder of Kubmo, a non-profit dedicated to building and teaching technology curriculum to young women around the world. She is the chair of the BridgeFoundry board and organizes the Scholars and Guides Programs for Ruby Central conferences. She is also obsessed with dogs, especially her dog Harleigh.', img: 'default-speaker.jpg'},
      {name: 'Dave Thomas', bio: 'Kubmo, a non-profit dedicated to building and teaching technology curriculum to young women around the world. She is the chair of the BridgeFoundry board and organizes the Scholars and Guides Programs for Ruby Central conferences. She is also obsessed with dogs, especially her dog Harleigh.', img: 'default-speaker.jpg'},
      {name: 'Dave Thomas', bio: 'Kinsey is a software engineer at GoSpotCheck in Denver, Colorado. She is the co-founder of Kubmo, a non-profit dedicated to building and teaching technology curriculum to young women around the world. She is the chair of the BridgeFoundry board and organizes the Scholars and Guides Programs for Ruby Central conferences. She is also obsessed with dogs, especially her dog Harleigh.', img: 'default-speaker.jpg'},
      {name: 'Dave Thomas', bio: 'Kinsey is a software engineer at GoSpotCheck in Denver, Colorado. She is the co-founder of Kubmo, a non-profit dedicated to building and teaching technology curriculum to young women around the world. She is the chair of the BridgeFoundry board and organizes the Scholars and Guides Programs for Ruby Central conferences. She is also obsessed with dogs, especially her dog Harleigh.', img: 'default-speaker.jpg'},
      {name: 'Dave Thomas', bio: 'Kinsey is a software engineer at GoSpotCheck in Denver, Colorado. She is the co-founder of Kubmo, a non-profit dedicated to building and teaching technology curriculum to young women around the world. She is the chair of the BridgeFoundry board and organizes the Scholars and Guides Programs for Ruby Central conferences. She is also obsessed with dogs, especially her dog Harleigh.', img: 'default-speaker.jpg'},
      {name: 'Dave Thomas', bio: 'Kinsey is a software engineer at GoSpotCheck in Denver, Colorado. She is the co-founder of Kubmo, a non-profit dedicated to building and teaching technology curriculum to young women around the world. She is the chair of the BridgeFoundry board and organizes the Scholars and Guides Programs for Ruby Central conferences. She is also obsessed with dogs, especially her dog Harleigh.', img: 'default-speaker.jpg'},
      {name: 'Dave Thomas', bio: 'Kinsey is a software engineer at GoSpotCheck in Denver, Colorado. She is the co-founder of Kubmo, a non-profit dedicated to building and teaching technology curriculum to young women around the world. She is the chair of the BridgeFoundry board and organizes the Scholars and Guides Programs for Ruby Central conferences. She is also obsessed with dogs, especially her dog Harleigh.', img: 'default-speaker.jpg'},
      {name: 'Dave Thomas', bio: 'Kinsey is a software engineer at GoSpotCheck in Denver, Colorado. She is the co-founder of Kubmo, a non-profit dedicated to building and teaching technology curriculum to young women around the world. She is the chair of the BridgeFoundry board and organizes the Scholars and Guides Programs for Ruby Central conferences. She is also obsessed with dogs, especially her dog Harleigh.', img: 'default-speaker.jpg'},
      {name: 'Dave Thomas', bio: 'Kinsey is a software engineer at GoSpotCheck in Denver, Colorado. She is the co-founder of Kubmo, a non-profit dedicated to building and teaching technology curriculum to young women around the world. She is the chair of the BridgeFoundry board and organizes the Scholars and Guides Programs for Ruby Central conferences. She is also obsessed with dogs, especially her dog Harleigh.', img: 'default-speaker.jpg'}
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
