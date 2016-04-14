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