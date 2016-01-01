class User < ActiveRecord::Base
 has_many :articles
 before_save { self.email = email.downcase }
 validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            length: { in: 3..5 }

 VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
 validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
             
 validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create # doet hetzelfde als REGEX
 has_secure_password
end