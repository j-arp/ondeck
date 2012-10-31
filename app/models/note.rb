class Note < ActiveRecord::Base
  belongs_to :item
  attr_accessible :content, :item_id
end
