require_relative 'db/config'

#--------------------------------------------
#Given any state, first print out the senators for that state (sorted by last name), then print out the representatives (also sorted by last name). Include the party affiliation next to the name. The output might look something like this:

def list_senators(z)
  puts "Senators:"

  a = Legislator.where("state = ? AND title =?", z, "Sen")
  a.each do |x|
    puts "#{x.firstname}" + " " + "#{x.middlename}" + " " + "#{x.lastname}" + " (" + "#{x.party}"+")"
  end
end

def list_representatives(z)
  puts "Representatives:"

  a = Legislator.where("state = ? AND title =?", z, "Rep")
  a.each do |x|
    puts "#{x.firstname}" + " " + "#{x.middlename}" + " " + "#{x.lastname}" + " (" + "#{x.party}"+")"
  end
end


# list_senators("CA")

# list_representatives("CA")

#------------------------------------------
# Given a gender, print out what number and percentage of the senators are of that gender as well as what number and percentage of the representatives, being sure to include only those congresspeople who are actively in office, e.g.:

def calc_sen

a = Legislator.where("title = ?","Sen")
allsenator = a.count

a = Legislator.where("gender = ? AND title = ?", "M", "Sen")
malesenator = a.count

percentage = ((malesenator.to_f/ allsenator.to_f)*100).to_i
puts "Male Senators:" + " "+ percentage.to_s + "%"
end


def calc_rep

a = Legislator.where("title = ?","Rep")
allrep = a.count

a = Legislator.where("gender = ? AND title = ?", "M", "Rep")
malerep = a.count

percentage = ((malerep.to_f/ allrep.to_f)*100).to_i
puts "Male Reps:" + " "+ percentage.to_s+ "%"
end

# calc_sen
# calc_rep

#------------------------------------------

#Print out the list of states along with how many active senators and representatives are in each, in descending order (i.e., print out states with the most congresspeople first).

def calc_sen2
  #Normal level
  states = Legislator.uniq.pluck(:state)
  # Ordering the states begin----------------
  array_of_count = []

  states.each do |state|
    array_of_count << [state, Legislator.where(state: state).count]
  end

  states = array_of_count.sort{|a,b| b[1] <=> a [1]}
  states.map!{|state| state[0]} #---> to get just the states--> ["HI","TX",etc]
  # Ordering states end---------------------------

  #God Level
  # states.map!{|state| [state, Legislator.where(state: state).count]}
  # states = Legislator.group(:state).count.sort{|a,b| b[1] <=> a[1]}.map(&:first)
  # states = Legislator.group(:state).order('count_state DESC').count('state')

  states.each do |state|
    puts "#{state}: #{ Legislator.where(title: "Sen", state: state).count}"+ " Sen" +  " #{ Legislator.where(title: "Rep", state: state).count }" + " Rep"
  end

end


# calc_sen2


#------------------------------------------

#For Senators and Representatives, count the total number of each (regardless of whether or not they are actively in office).

def bla
a = Legislator.where("title = ?", "Sen")
b = Legislator.where("title = ?", "Rep")
p a.count
p b.count
end

bla

#------------------------------------------
#Now use ActiveRecord to delete from your database any congresspeople who are not actively in office, then re-run your count to make sure that those rows were deleted.

def del
  a = Legislator.where("in_office = ? AND title =?", false ,'Sen').destroy_all
    b = Legislator.where("in_office = ? AND title =?", false,'Rep').destroy_all
#check if deleted
  c = Legislator.where("title = ?",'Sen')
  d = Legislator.where("title = ?",'Rep')
p c.count
p d.count

end

# del


#--------------------------------------