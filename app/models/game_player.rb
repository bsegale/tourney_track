class GamePlayer < ActiveRecord::Base
	belongs_to :game
	validates_presence_of :name
	validates_length_of :name, :minimum => 2, :maximum => 75
	validates_uniqueness_of :name, :scope => :game_id
  #validates_format_of :player_index, :with => /[\+-]\d{0,10}\.\d{2}/,
    #:message => "Must be +- nn.dd format like 10.2"
  validates :player_index, :format => { :with => /\d{0,10}\.\d{1}/ }, :numericality => {:greater_than => -10, :less_than => 10}
end
