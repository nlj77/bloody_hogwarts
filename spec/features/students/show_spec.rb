require 'rails_helper'

RSpec.describe 'students show page' do
    it "shows a list of the student's courses" do 
        harry = Student.create!(name: "Harry Potter", age: 13, house: "Griffindor")
        draco = Student.create!(name: "Draco Malfoy", age: 14, house: "Slytherin")

        herbology = Course.create(name: "Herbology")
        dada = Course.create(name: "Defense Against the Dark Arts")
        death_eating = Course.create(name: "Death Eating")

        student_course_1 = StudentCourse.create!(student_id: harry.id, course_id: herbology.id)
        student_course_2 = StudentCourse.create!(student_id: draco.id, course_id: herbology.id)
        student_course_3 = StudentCourse.create!(student_id: harry.id, course_id: dada.id)
        student_course_4 = StudentCourse.create!(student_id: draco.id, course_id: death_eating.id)

        visit "/students/#{harry.id}"

        expect(page).to have_content("Herbology")
        expect(page).to have_content("Defense Against the Dark Arts")
        expect(page).to have_no_content("Death Eating")




    end
end

# User Story 2 of 4

# As a visitor,
# When I visit '/students/:id'
# I see a list of the students' courses.

# (e.g. "Defense against the Dark Arts"
#       "Herbology"
#       "Potions")
