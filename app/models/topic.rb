# === Schema Information
#
# Table name: topics
#
# id 							:integer not null, primary key
# category_id 		:integer
# topic_id				:integer
# title  					:string
# description 		:text
# icon 						:string
# banner 					:string
# snap_shot 			:string
#
# created_at 			:datetime
# updated_at 			:datetime

class Topic < ActiveRecord::Base
	# mount_uploader :snap_shot, SnapShotUploader
	belongs_to :category
	has_many :seasons, dependent: :destroy
	has_many :episodes, dependent: :destroy
end
