module CompaniesHelper
  def create_company_dependencies
    @branch = @company.branches.build(company_params)
    @branch.main_branch = true
    @branch.save
    @storage = @branch.storages.build(company_params)
    @storage.company_id =  @company.id
    @storage.main_storage = true
    @storage.save
  end
  def update_company_dependencies
    @branch = Branch.find_by_company_id_and_main_branch(@company.id, true)
    @branch.update(company_params)
    @storage = Storage.find_by_branch_id_and_main_storage(@branch.id, true)
    @storage.update(company_params)
  end
end
