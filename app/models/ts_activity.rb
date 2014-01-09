
class TsActivity < ActiveRecord::Base
  belongs_to :order, :class_name => 'Version', :foreign_key => 'order_id'
  has_many :activities, :class_name => 'TimeEntryActivity', :foreign_key => 'activity_id'
end