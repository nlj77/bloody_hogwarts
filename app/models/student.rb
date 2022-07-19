class Student < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :house
    validates_presence_of :age
    has_many :student_courses
    has_many :courses, through: :student_courses
end
