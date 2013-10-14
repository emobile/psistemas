# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create(name: "System Administrator", protected: true, super_admin: true, clinic_manager: false, doctor: false, secretary: false, patient: false, guess: false, description: "Can manage the complete system.")
Role.create(name: "Guess", protected: true, super_admin: false, clinic_manager: false, doctor: false, secretary: false, patient: false, guess: true, description: "Can only see his/her account.")
Role.create(name: "Clinic Manager", protected: true, super_admin: false, clinic_manager: true, doctor: false, secretary: false, patient: false, guess: false, description: "Can manage clinic.")
Role.create(name: "Doctor", protected: true, super_admin: false, clinic_manager: false, doctor: true, secretary: false, patient: false, guess: false, description: "Can manage patients records.")
Role.create(name: "Secretary", protected: true, super_admin: false, clinic_manager: false, doctor: false, secretary: true, patient: false, guess: false, description: "Can manage appointments.")
Role.create(name: "Patient", protected: true, super_admin: false, clinic_manager: false, doctor: false, secretary: false, patient: true, guess: false, description: "Can manage his/her own records.")


User.create(first_name: 'System', last_name: 'Administrator', username: 'administrator', email: 'alexjabf@gmail.com', phone1: "6142479483", phone2: "6142479483", fax: "6142479483", address1: "Calle paseos de madera #14521", address2: "Paseos de chihuahua", city: "Chihuahua", state: "Chihuahua", zip: 31125, country: "Mexico", password: 'Password1', password_confirmation: 'Password1', confirmed_at: Date.today, role_id: 1, active: true)
User.create(first_name: 'Guess', last_name: 'User', username: 'guess.user', email: 'alexjabf@hotmail.com', phone1: "6142479483", phone2: "6142479483", fax: "6142479483", address1: "Calle paseos de madera #14521", address2: "Paseos de chihuahua", city: "Chihuahua", state: "Chihuahua", zip: 31125, country: "Mexico", password: 'Password1', password_confirmation: 'Password1', confirmed_at: Date.today, role_id: 2, active: true)