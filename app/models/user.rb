class User < ActiveRecord::Base
 validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            lenght: { in: 3..5 }
 VALID_EMAIL_REGEX: 
 validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            lenght: { maximum: 105 }
            format: { with: VALID_EMAIL_REGEX }
end