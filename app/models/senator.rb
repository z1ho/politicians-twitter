class Senator < Legislator
	:firstname
	:lastname
	:phone
	:fax
	:website
	:webform
	:party
	:gender
	:birthdate
	:twitter_id
	:state
	:in_office


	def self.senator_state(name_state)
		list1 = self.where("state = ? AND title = ?", "name_state", "Sen").first
		list2 = self.where("state = ? AND title = ?", "name_state", "Sen").last

		puts "#{list1[:firstname]} #{list1[:lastname]}"
		puts "#{list2[:firstname]} #{list2[:lastname]}"
	end

	def self.pol_party(party)
		list = self.where("party = ?", party)
		puts list
	end

	def find(firstname, lastname)
		sen = self.where("firstname = ? AND lastname = ? AND party = ?", firstname, lastname, "sen")
		puts "#{sen.firstname} #{sen.lastname} #{sen.phone} #{sen.fax} #{sen.website} #{sen.webform} #{sen.party} #{sen.gender} #{sen.birthdate} #{sen.twitter_id}"
	end

	def office(firstname, lastname)
		sen = self.where("firstname = ? AND lastname = ?", firstname, lastname)
		puts sen.in_office
	end

end


