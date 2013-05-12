class Employee < ActiveRecord::Base
  attr_accessible :name, :nif, :sec_social_number, :company, 
    :contribution_group, :contribution_group_id

  has_many :payrolls
  belongs_to :company
  belongs_to :contribution_group

  VALID_NIF_REGEX = /\A[0-9]{8}[a-zA-Z]{1}\z/
  
  validates :name, presence: true
  validates :nif, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_NIF_REGEX }
  validates :sec_social_number, presence: true, numericality: true, length: { is: 12 }
  validates :company, presence: true
  validates :contribution_group, presence: true

  scope :by_company, ->(company) { where(company_id: company.id) }
end