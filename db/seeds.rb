
# Create some doctors
doctor1 = Member.create(first_name: "Alice", last_name: "Smith", gender: 1, age: 45, role: 1)
doctor2 = Member.create(first_name: "Bob", last_name: "Johnson", gender: 1, age: 50, role: 1)

# Create some patients
patient1 = Member.create(first_name: "Carol", last_name: "Davis", gender: 2, age: 30, role: 2)
patient2 = Member.create(first_name: "Dave", last_name: "Miller", gender: 1, age: 35, role: 2)


Opportunity.find_or_create_by(procedure_name: "Procedure A", patient: patient1, doctor: doctor1, stage_history: [{ stage_name: "Leads", timestamp: Time.now }])
Opportunity.find_or_create_by(procedure_name: "Procedure B", patient: patient2, doctor: doctor2, stage_history: [{ stage_name: "Leads", timestamp: Time.now }])
Opportunity.find_or_create_by(procedure_name: "Procedure A", patient: patient1, doctor: doctor1, stage_history: [{ stage_name: "Leads", timestamp: Time.now }])
Opportunity.find_or_create_by(procedure_name: "Procedure m", patient: patient2, doctor: doctor2, stage_history: [{ stage_name: "Leads", timestamp: Time.now }])
Opportunity.find_or_create_by(procedure_name: "Procedure D", patient: patient2, doctor: doctor2, stage_history: [{ stage_name: "Leads", timestamp: Time.now }])



