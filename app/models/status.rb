class Status < ActiveRecord::Base
  belongs_to :project
  has_many :user_stories, :order => "position"

  validates :name, :presence => true

  def availability
    if wip
      wip - user_stories.count
    else
      '-'
    end
  end
end

