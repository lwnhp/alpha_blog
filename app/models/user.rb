class User < ActiveRecord::Base
 validates :username, presence: true,
            uniqueness: { case_sensitive: false }
            # lenght: { in: 3..5 }

 validates :email, presence: true,
            uniqueness: { case_sensitive: false }
            # lenght: { maximum: 105 }
 validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end