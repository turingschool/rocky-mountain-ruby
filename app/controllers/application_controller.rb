class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  invisible_captcha only: [:contact], honeypot: :topic

  def index
    @nav = setup_nav_links

  	@schedule = [
  		{time: '9:00 am',  length: '60 minutes', title: 'Registration, Continental Breakfast'},
  		{time: '10:00 am', length: '5 minutes',  title: 'Opening/Kickoff'},
  		{time: '10:05 am', length: '35 minutes', title: 'Ben Orenstein'},
  		{time: '10:45 am', length: '35 minutes', title: 'Sarah Mei'},
  		{time: '11:25 am', length: '35 minutes', title: 'Announcing Soon'},
  		{time: '12:05 pm', length: '35 minutes', title: 'Announcing Soon'},
  		{time: '12:45 pm', length: '60 minutes', title: 'Lunch'},
  		{time: '1:45 pm',  length: '5 minutes',  title: 'Reconvene'},
  		{time: '1:50 pm',  length: '35 minutes', title: 'Announcing Soon'},
      {time: '2:30 am',  length: '15 minutes', title: 'Community Spotlight: Announcing Soon'},
  		{time: '2:50 pm',  length: '15 minutes', title: 'Community Spotlight: Announcing Soon'},
      {time: '3:10 pm',  length: '35 minutes', title: 'Announcing Soon'},
      {time: '3:50 pm',  length: '35 minutes', title: 'Announcing Soon'},
      {time: '4:30 pm',  length: '5 minutes',  title: 'Thanks & Closing'},
      {time: '4:35 pm',  length: '85 minutes', title: 'Social Hour'}
  	]

    @speakers = [
      { name: 'Sarah Mei',
        bio: "Sarah is a Chief Consultant at DevMynd Software where she works to help clients untangle the most tangled projects. She is a co-founder of <a href='http://railsbridge.org'>RailsBridge</a>, board member of <a href='http://rubycentral.org'>Ruby Central</a>, frequent speaker at <a href='http://confreaks.tv/presenters/sarah-mei'>technical conferences</a>, and prolific author of tweet storms actually worth reading.",
        img: 'speakers/sarah-mei.jpg',
        twitter: 'https://twitter.com/sarahmei'
      },

      { name: 'Ben Orenstein',
        bio: "<a href='http://www.benorenstein.com'>Ben</a> has spent many years at thoughtbot and recently stepped out on his own to form a new company. In recent years he’s build <a href='http://upcase.com'>Upcase</a>, hosted the <a href='http://giantrobots.fm'>Giant Robots</a> podcast, and further spread the virus/virtue of Vim. You can find some of his previous conference talks on <a href='http://confreaks.tv/presenters/ben-orenstein'>Confreaks</a>.",
        img: 'speakers/ben-orenstein.jpg',
        twitter: 'https://twitter.com/r00k'
      },
    ]

    @sponsors = {
      'sponsors/honeybadger.png'   => 'http://honeybadger.io',
      'sponsors/rubyappcare.png'   => 'http://rubyappcare.com',
      'sponsors/turing-school.png' => 'http://turing.io'
    }

    @media_sponsors = {
      'sponsors/rubygarage.png'  => 'https://rubygarage.org'
    }

    @sections = %w(hero schedule location speakers contact)
    # @sections = %w(hero location speakers schedule contact sponsors media_sponsors)
  end

  def scholars_program
    @nav         = setup_nav_links
    @active_path = '/scholars-program'
  end

  def policy
    @nav         = setup_nav_links
    @active_path = '/policy'
  end

  def contact
    ContactMailer.form_request(params[:name], params[:email], params[:comment]).deliver_now
    render text: 'Message sent successfully. Thank you.', status: 200
  end

  private

  def setup_nav_links
    [
      {title: 'Schedule',               href: '/#schedule'},
      {title: 'Location',               href: '/#location'},
      {title: 'Speakers',               href: '/#speakers'},
      {title: 'Contact',                href: '/#contact'},
      # {title: 'Sponsors',               href: '/#sponsors'},
      {title: 'Tickets',                href: 'https://rockymtnruby2017.busyconf.com/bookings/new'},
      # {title: 'Scholars',               href: '/scholars-program'},
      {title: 'Anti-Harrasment Policy', href: '/policy'}
    ]
  end
end
