class User < ApplicationRecord

  before_save :set_format

  # VALIDATION
  VALID_EMAIL_REGEX = /\A[\w+\-]+@[a-z\d\-.]+\.[a-z]+\z/i
  # hashing password
  has_secure_password
  attr_accessor :creating_user


  validates   :first_name,
              presence:       true,
              length:         { minimum: 2, message: 'too short lah'},
              format:         { with: /\A([a-zA-Z]+\s?)*\z/}

  validates   :last_name,
              presence:       true,
              format:         { with: /\A([a-zA-Z]+\s?)\z/}

  validates   :email,
              presence:       true,
              format:         { with: VALID_EMAIL_REGEX },
              uniqueness:     { case_insensitive: false }

  validates  :password,
              presence:       true,
              length:         { minimum: 6 },
              allow_nil:      true


  validates  :mobile_number,
              format:          { with: /\A\d{8}\z/ },  # 8-digit numbers (SG)
              unless:          :creating_user
              # allow_nil:       true

  private
    def set_format
      self.email.downcase!
      self.first_name.capitalize!
      self.last_name.capitalize!
    end
end
