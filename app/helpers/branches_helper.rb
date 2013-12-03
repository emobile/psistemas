module BranchesHelper
  def create_branch_dependencies
    ClientType.create(name: "General", description: "Precio base al publico.", company_id: @branch.company_id, branch_id: @branch.id)
    MeasurementUnit.create(name: "Kg", description: "Kilogramos.", company_id: @branch.company_id, branch_id: @branch.id)
    MeasurementUnit.create(name: "Lb", description: "Libra.", company_id: @branch.company_id, branch_id: @branch.id)
    MeasurementUnit.create(name: "L", description: "Litro.", company_id: @branch.company_id, branch_id: @branch.id)
    MeasurementUnit.create(name: "p/u", description: "Por unidad.", company_id: @branch.company_id, branch_id: @branch.id)
  end
end
