
class TsPermission < ActiveRecord::Base
  belongs_to :order, :class_name => 'WorkOrder', :foreign_key => 'order_id'
  belongs_to :user

  # permissions
  NONE = 0
  VIEW = 1
  EDIT = 2
  ADMIN = 3

  validates_inclusion_of :access, :in => NONE..ADMIN

  scope :for_user, lambda {|*args|
    user = (args.first || User.current)
    where(:user_id => user)
  }

  scope :over, lambda {|order|
    where(:order_id => order)
  }
end