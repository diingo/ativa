# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.destroy_all
Phase.destroy_all
Post.destroy_all
User.destroy_all

phases = ['onboarding','creative', 'design', 'development', 'implementation']

phases.each do |phase|
	Phase.create(name: phase)
end
projects = [
	'Mother Flocker',
	'Gifanator',
	'ATX Jobs', 
	'Connect2Good',
	'Bring Up',
	'Harsh is the Cool',
	'Matt is Better',
	'MakerSquare'
]

projects.each do |project|
	Project.create(name: project, phase_id: Phase.first.id)
end

puts "Added projects"

users = ["Shehzan", "Matt", "Harsh", "Shaan", "Ravi"]
users.each do |u|
  Client.create(name: u, email: "#{u}@themakersquare.com", password: "password", password_confirmation: "password")
end

puts "Added users"

messages = [
	"Mousepads grammarians hailinator what Taylor Sager bootstrap Shannon, Heroku soda! Induction toss The best way to attract women to coding is when they're girls. Support up blog: potluck framework error! Alfred workshop coffee A should Krista whiteboard board, issues create! Student fatfinger toss backpacks; unicorns milk map calendar challenges. Use fat photoshop window Nature Nathaniel Lydia - container. Yoga JQuery everywhere in damn rake, Alfred happy? Inheritance Dropbox what Austin be shit pizza, Uno read punctuation? Jenga else we couch test array idea instance shit; charge.",
	"Year nut Rails car then tutorial; hard syntactical. Backpack honey syntax - HTML storing accessible chocolate data sort read. Browser, today Matt board hooks photoshop up toss! Issues the, phone Nathaniel Twitter So Ryan breaks the budget but we can study the past to improve the future: fat SizeUp CRUD self. Backpacks Krista spoon doorbell re:inv add wine and salad to the beer and pizza. As someone with a wheat allergy I'd be happier. bacon Sublime everywhere HDMI we! Exec has, sleep see science OSX interpolation float! Class re:inv Learn to work with women. We both need to appreciate differences. Ridgid six-pack foosball Doa, rail zsh. Food Twitter maker Doa, framework backpacks new rail in projector.",
	"Yes push fat TeenageMutantNinjaTurtles butter source, sign expo script re:inv Learn to work with women. We both need to appreciate differences. ! Pro Active attr models login today yes: save data float? Jason accessible script let's grammarians command Twitter: actually. Ideator irb ipsum Rachel module error, Nathaniel function demos? Hailinator, all hell Sager movies exec container up migrate float. Load interpretor zsh interpretor CSS Harsh battery module! Re:inv learn to work with women. we both need to appreciate differences. radio rail: Pati Facebook nut soda Rails hell marker! Projector that chimpanzees: new database good load Twitter plastic development?",
	"Dropbox - hard push Doa has the demos views soda! Attribute irb unicorns loop - we Dropbox array Windows? Nature: photoshop blog Tim account Lydia loop relationship car loop? Bootstrap method re:inv add wine and salad to the beer and pizza. As someone with a wheat allergy I'd be happier. factory plasticware train DoratheExplorer list? Script pair Heroku projector A hailinator fuck; Cheerios Tina? Error - data Tim shit load we Re:involvement I attended and appreciated the presence of women speakers. Harsh development. Irb JQuery instance Austin Jenga last laptop, list. Read meetup - ultimate Windows weeks whiteboard programmers instance migrate should? We Android compile create docs beer DoratheExplorer, Projector? Chocolate - HTML source programmers extensions exec chimpanzees value map db!"
]

Project.all.each do |project|
	Phase.all.each do |phase|
		10.times do |num|
			Post.create(
				message: messages[rand(4)],
				title: "#{phase.name.capitalize} Revision #{num + 1}",
				project_id: project.id,
				phase_id: phase.id
			)
		end
	end
end

puts "Added posts to every project (without an image)"
puts "Upload some images!"


