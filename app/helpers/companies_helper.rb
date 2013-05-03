module CompaniesHelper
	def show_or_new_company_path(company)
		if company
			company_path(company.id)
		else
			new_company_path
		end
	end
end
