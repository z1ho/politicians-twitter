class Representative < Legislator
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
	:name_suffix	


	def pol_party(party)
		list = self.where("party = ? AND title = ?", party, "Rep")
			list.each {|rep| puts "#{rep.firstname} #{rep.lastname} #{rep.name_suffix}"}
			end
	end

	def find(firstname, lastname)
		rep = self.where("firstname = ? AND lastname = ? AND party = ?", firstname, lastname, "rep")
		puts "#{rep.firstname} #{rep.lastname} #{rep.phone} #{rep.fax} #{rep.website} #{rep.webform} #{rep.party} #{rep.gender} #{rep.birthdate} #{rep.twitter_id}"
	end

	def office(firstname, lastname)
		rep = self.where("firstname = ? AND lastname = ?", firstname, lastname)
		puts rep.in_office
	end

end