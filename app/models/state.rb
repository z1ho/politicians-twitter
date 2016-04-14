class Legislator < ActiveRecord::Base

	:title
	:firstname
	:lastname
	:name_suffix
	
	def self.state(name_state)
		list = self.where("state = ? AND title = ?", name_state, "Rep")
		list.each {|rep| puts "#{rep.name_suffix} #{rep.firstname} #{rep.lastname}"}
		end
	end
		
end