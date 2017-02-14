#
# Table Schema
# ------------
# id            - int(11)      - default NULL
# host_name     - varchar(255) - default NULL
# host_email    - varchar(255) - default NULL
# numgsts       - int(11)      - default NULL
# guest_names   - text         - default NULL
# venue         - varchar(255) - default NULL
# location      - varchar(255) - default NULL
# theme         - varchar(255) - default NULL
# when          - datetime     - default NULL
# when_its_over - datetime     - default NULL
# descript      - text         - default NULL
#
class Party < ApplicationRecord
  # Setting the checking of when_its_over
  before_save :check_when_its_over, :clean_guest_name
  # Constants
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # Validations
  validates :host_name, length: {maximum: 255, message: "Input was too long."}
  validates :host_email, presence: true, length: {maximum: 255, message: "Input was too long."},
                          format: { with: VALID_EMAIL_REGEX }
  validates :venue, length: {maximum: 255, message: "Input was too long."}
  validates :location, length: {maximum: 255, message: "Input was too long."}
  validates :theme, length: {maximum: 255, message: "Input was too long."}

  # Uses a custom validation => :validations
  validate :validations

  def validations
    #if self.host_name.length>255 || self.host_email.length>255 || self.venue.length>255 || self.location.size>255 || self.theme.size>255
      #errors.add(:base,"Input was too long.")
    #end
    # ruby doesn't like us using when as column name for some reason
    if self.when > self.when_its_over
      errors.add(:base,"Incorrect party time.")
    end
    if self.numgsts.nil?
      self.numgsts = 0
    end
    if self.venue.length > 0 && self.location.length < 0
      errors.add(:location,"Where is the party?")
    end
    if self.guest_names.split(',').size != self.numgsts
      errors.add(:guest_names,"Missing guest name")
    end
  end

  def clean_guest_name
    # clean "Harry S. Truman" guest name to "Harry S._Truman"
    # clean "Roger      Rabbit" guest name to "Roger Rabbit"
    # binding.pry
    gnames = []
    self.guest_names.split(',').each do |g|
      g.squeeze! #removes repeated characters
      names=g.split(' ')
      gnames << "#{names[0]} #{names[1..-1].join('_')}"
    end
    # binding.pry
    self.guest_names = gnames.join(', ')
  end

  def check_when_its_over
    if self.when_its_over.blank?
      self.when_its_over = self.when.end_of_day
    end
  end

end
