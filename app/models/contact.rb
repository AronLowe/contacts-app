
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Contact < ApplicationRecord
  belongs_to :user
  has_many :group_contacts
  has_many :groups, through: :group_contacts
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, email: true

  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}" #it knows its name, dont need contact.first_name
  end

end
