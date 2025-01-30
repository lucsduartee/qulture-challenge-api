Company.destroy_all
Employee.destroy_all

company1 = Company.create!(name: "Empresa A")
company2 = Company.create!(name: "Empresa B")

employees_company1 = []
10.times do |i|
  employees_company1 << Employee.create!(
    name: "Funcionário A#{i + 1}",
    email: "funcionario_a#{i + 1}@empresa_a.com",
    company: company1
  )
end

employees_company2 = []
10.times do |i|
  employees_company2 << Employee.create!(
    name: "Funcionário B#{i + 1}",
    email: "funcionario_b#{i + 1}@empresa_b.com",
    company: company2
  )
end

employees_company1[0].update(manager: employees_company1[1])
employees_company1[2].update(manager: employees_company1[1])
employees_company1[3].update(manager: employees_company1[4])
employees_company1[5].update(manager: employees_company1[4])

employees_company2[0].update(manager: employees_company2[1])
employees_company2[2].update(manager: employees_company2[1])
employees_company2[3].update(manager: employees_company2[4])
employees_company2[5].update(manager: employees_company2[4])

puts "Seed concluído com sucesso!"
