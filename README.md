ActiveRecord Sunlight Legislators
=================================

To get started:

1. Fork this repository.
2. Clone your fork of this repository into your working directory.
3. Install the necessary dependencies using Bundler: `$ bundle`
4. Create your database: `$ rake db:create`
5. Implement the objectives as described in the challenge in Socrates.


* git init # create .git key inside ur current dir, which serves as a key
* git remote add origin/github/gitlab <destinationxxxx.git>
* git add .
* git commit -m "which feature or file is added"
* git push origin/github/gitlab master

=================================
CHALLENGE 2

1) 

Created a list of everyone within a certain Party
		
		def pol_party(party)
		list = self.where("party = ? AND title = ?", party, "Rep")
			list.each {|rep| puts "#{rep.firstname} #{rep.lastname} #{rep.name_suffix}"}
			end
		end


2) MIGRATING FILES!

	Create a new file in the migrate folder
	NOTE 1) YYYYMMDDHHMMSS_class_name_in_snake_case.rb


   SCRUB AND IMPORT THE DATA / MODIFYING THE COLUMNS
		require 'csv'

		class SunlightLegislatorsImporter
		  def self.import(filename)
		    csv = CSV.new(File.open(filename), :headers => true)
		    array = ['firstname', 'lastname','twitter_id']

		    ### array is for the attributes that we want to keep ###

		    csv.each do |row|
		      row = row.to_hash
		      hash = {}
		        row.each do |field, value|
		          hash[field] = value
		            hash.keep_if {|k, v| array.include? k }

		        ### checks if the key exists in the array and keeps it if it's true i.e. array.include? k ###
		                
		          end
		        Legislator.create(hash)
		    end
		  end
		end




=================================
CHALLENGE 3

1) SINGLE TABLE INHERITANCE
	
	>> Created tweet.rb file under 'models' folder

	require_relative '../../db/config'

		class Tweet < ActiveRecord::Base
			belongs_to :legislator
		end

	>> Created migration file YYYYMMDDHHSS_name_blahblah.rb

	require_relative '../config'

	class CreateTweets < ActiveRecord::Migration
		def change
			create_table :tweets do |t|
				t.string :text
				t.belongs_to :legislator

				t.timestamps null: false
			end
		end
	end


	NOTE 2) CHECK CONFIG FILE TO ENSURE THEY'RE CONNECTED
		require_relative '../app/models/legislator'
		require_relative '../app/models/tweet'


2) ADDED TWEETS


	rake console

		Call object from Legislator table (Legislator.new)
