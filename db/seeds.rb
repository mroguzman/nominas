# encoding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

contribution_group_1 = ContributionGroup.new(number: 1, professional_category: 'Ingenieros y Licenciados', min_base_salary: 1051.50, max_base_salary: 3425.70)
contribution_group_1.id = 1
contribution_group_1.save!

contribution_group_2 = ContributionGroup.new(number: 2, professional_category: 'Ingenieros Técnicos, Peritos y Ayudantes Titulados', min_base_salary: 872.10, max_base_salary: 3425.70)
contribution_group_2.id = 2
contribution_group_2.save!

contribution_group_3 = ContributionGroup.new(number: 3, professional_category: 'Jefes Administrativos y de Taller', min_base_salary: 758.70, max_base_salary: 3425.70)
contribution_group_3.id = 3
contribution_group_3.save!

contribution_group_4 = ContributionGroup.new(number: 4, professional_category: 'Ayudantes no Titulados', min_base_salary: 753.00, max_base_salary: 3425.70)
contribution_group_4.id = 4
contribution_group_4.save!

contribution_group_5 = ContributionGroup.new(number: 5, professional_category: 'Oficiales Administrativos', min_base_salary: 753.00, max_base_salary: 3425.70)
contribution_group_5.id = 5
contribution_group_5.save!

contribution_group_6 = ContributionGroup.new(number: 6, professional_category: 'Subalternos', min_base_salary: 753.00, max_base_salary: 3425.70)
contribution_group_6.id = 6
contribution_group_6.save!

contribution_group_7 = ContributionGroup.new(number: 7, professional_category: 'Auxiliares Administrativos', min_base_salary: 753.00, max_base_salary: 3425.70)
contribution_group_7.id = 7
contribution_group_7.save!