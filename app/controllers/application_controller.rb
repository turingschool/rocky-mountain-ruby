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
      {time: '10:05 am', length: '35 minutes', title: 'Sarah Mei'},
      {time: '10:45 am', length: '35 minutes', title: 'Amy Chen: <em>Building Helm Charts from the Ground Up: An Introduction to Kubernetes</em>'},
      {time: '11:25 am',  length: '10 minutes', title: '<em>Community Spotlight</em>: Carrie Simon from Defy Ventures'},
      {time: '11:40 am', length: '35 minutes', title: 'April Wensel: <em>A Discussion on Responsible Hiring & Team Building</em>'},
      {time: '12:15 pm', length: '60 minutes', title: 'Lunch'},
      {time: '1:10 pm',  length: '5 minutes',  title: 'Reconvene'},
      {time: '1:15 pm', length: '35 minutes', title: 'Anjuan Simmons: <em>Leadership Lessons from the Agile Manifesto</em>'},
      {time: '1:55 pm',  length: '35 minutes', title: 'Adam Cuppy'},
  		{time: '2:35 pm',  length: '10 minutes', title: '<em>Community Spotlight</em>: Elaine Marino from Equili'},
      {time: '2:50 pm',  length: '35 minutes', title: 'Vaidehi Joshi'},
      {time: '3:30 pm',  length: '35 minutes', title: 'Brittany Storoz'},
      {time: '4:10 pm',  length: '35 minutes', title: 'Ben Orenstein'},
      {time: '4:45 pm',  length: '5 minutes',  title: 'Thanks & Closing'},
      {time: '4:50 pm',  length: '85 minutes', title: 'Social Hour'}
  	]

    @speakers = [
      { name: 'Sarah Mei',
        bio: "Sarah is a Chief Consultant at DevMynd Software where she works to help clients untangle the most tangled projects. She is a co-founder of <a href='http://railsbridge.org'>RailsBridge</a>, board member of <a href='http://rubycentral.org'>Ruby Central</a>, frequent speaker at <a href='http://confreaks.tv/presenters/sarah-mei'>technical conferences</a>, and prolific author of tweet storms actually worth reading.",
        img: 'speakers/sarah-mei.jpg',
        twitter: 'https://twitter.com/sarahmei'
      },

      { name: 'Amy Chen',
        bio: "Amy is a software engineer at Rancher Labs. She is passionate about open source, containers, orchestration tools, Go, and salsa dancing. Amy runs a youtube channel <a href='https://www.youtube.com/AmyCodes'>Amy Codes</a> where she talks about technical and non-technical aspects of being a software engineer.",
        img: 'speakers/amy-chen.jpg',
        twitter: 'https://twitter.com/theamycode'
      },

      { name: 'Defy Ventures',
        bio: "Defy Ventures works to 'transform the hustle' of currently and formerly incarcerated Entrepreneurs-in-Training by offering intensive leadership development, business plan competitions, executive mentoring, financial investment, and startup incubation.",
        img: 'speakers/defy-ventures.jpg',
        twitter: 'https://twitter.com/defyventures'
      },

      { name: 'April Wensel',
        bio: "April Wensel spent the past decade as a software engineer and technical leader at various Silicon Valley startups before starting <a href='http://compassionatecoding.com'>Compassionate Coding</a>, a company that’s bringing emotional intelligence to the software development community. She loves running marathons, cooking vegan food, and teaching coding to kids.",
        img: 'speakers/april-wensel.jpg',
        twitter: 'https://twitter.com/aprilwensel'
      },

      { name: 'Anjuan Simmons',
        bio: "Anjuan Simmons is a technologist with a successful track record of delivering technology solutions from the user interface to the database. He presents at conferences, seminars, schools, and community centers around the world on topics including Agile software development, diversity, and leadership. Anjuan has an undergraduate degree in electrical engineering from the University of Texas at Austin and an MBA from Texas A&M University.",
        img: 'speakers/anjuan-simmons.jpg',
        twitter: 'https://twitter.com/anjuan'
      },

      { name: 'Adam Cuppy',
        bio: "Adam is not a best selling author, Fortune 500 CEO, nor a Nobel Prize recipient. He is, nevertheless, the co-founder of Coding Zeal, experienced developer, and occasional thespian.",
        img: 'speakers/adam-cuppy.jpg',
        twitter: 'https://twitter.com/adamcuppy'
      },

      # { name: 'Equili',
      #   bio: "Equili is spearheading an industry-wide movement to transform diversity in the tech space. We design, implement, and manage events, workshops, and content aimed at bringing more diversity into the tech arena.",
      #   img: 'speakers/equili.jpg',
      #   twitter: 'https://twitter.com/_equili'
      # },

      { name: 'Vaidehi Joshi',
        bio: "Vaidehi is a software engineer at Tilde, where she works on Skylight—your favorite Rails profiler! She enjoys building and breaking code, but she loves creating empathetic engineering teams a whole lot more. In her spare time, she runs <a href='https://medium.com/basecs'>basecs</a>, a weekly writing series that explores the fundamentals of computer science.",
        img: 'speakers/vaidehi-joshi.jpg',
        twitter: 'https://twitter.com/sarahmei'
      },

      { name: 'Brittany Storoz',
        bio: "Brittany has been an EMT, swim coach, and sports reporter but there is little she loves more than programming. She’s been a programmer for almost ten years, focusing on front-end HTML, CSS and JavaScript while working at Mozilla, The New York Times, and teaching at The Turing School.",
        img: 'speakers/brittany-storoz.jpg',
        twitter: 'https://twitter.com/brittanystoroz'
      },

      { name: 'Ben Orenstein',
        bio: "<a href='http://www.benorenstein.com'>Ben</a> has spent many years at thoughtbot and recently stepped out on his own to form a new company. In recent years he’s built <a href='http://upcase.com'>Upcase</a>, hosted the <a href='http://giantrobots.fm'>Giant Robots</a> podcast, and further spread the virus/virtue of Vim. You can find some of his previous conference talks on <a href='http://confreaks.tv/presenters/ben-orenstein'>Confreaks</a>.",
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
      {title: 'Anti-Harassment Policy', href: '/policy'}
    ]
  end
end
