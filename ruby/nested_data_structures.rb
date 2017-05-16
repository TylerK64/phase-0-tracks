school = {
	rooms: {
		classroom: {
			student_desk: ['paper', 'pens', 'pencils'],
			teacher_desk: ['gradebook', 'markers', 'guidebook']
			},

		gym: {
			locker_room: {
				lockers: [100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110],
				towels: [1, 2, 3, 4, 5]
				},
			basketball_court: {
				hoops: [1,2],
				balls: [[1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4], [1, 2]] #basketballs, baseballs, and soccer balls
				},
			},

		cafeteria: {
			food: ['oranges', 'carrots', 'chicken'],
			supplies: [['tables', 'chairs', 'food stands'], ['forks', 'knives', 'spoons', 'napkins'], ['plates', 'bowls', 'trays']] 
			}
	},

	faculty: {
		principal: "George Smith",
		vice_principal: "Frank Jones",
		teachers: ['Mr. Doe', 'Mrs. Doe', 'Mr. Adams', 'Mr. F', 'Mrs. B', 'Mr. K'],
		janitors: ['Mark G.', 'Kevin A.', 'Bob L.'],
		total: 11
	},

	students: {
		student1: {
			name: 'Anthony A.',
			year: 10,
			grades: ['A', 'B', 'C', 'D', 'B', 'A']
		},
		student2: {
			name: 'Brooke B.',
			year: 9,
			grades: ['B', 'B', 'A', 'C', 'B', 'A']
		},
		student3: {
			name: 'Calvin C.',
			year: 11,
			grades: ['C', 'A', 'B', 'B', 'A', 'D']
		},
		#total: 3
	}
}

puts school[:rooms][:classroom][:student_desk][2]
puts school[:rooms][:classroom][:teacher_desk][1] = 'colored markers'
puts school[:rooms][:gym][:locker_room][:lockers].length
p school[:rooms][:gym][:basketball_court][:balls].reverse!
puts school[:faculty].length
puts school[:faculty][:principal] += " Senior"

student_key = {}
student_key.merge!(school[:students].each {|student_id, info| puts "#{student_id}'s information is: #{info}"}) #prints ID and info for every student

student_key2 = school[:students].map do |student_id, info|
	puts "#{student_id}'s information is: #{info}"
end #last three lines are performing basically the same action as lines 60-61 (by slightly different means)

student_key3 = school[:students].select {|student_id, info| info.include?(:name)} #hash of students which contain a :name key
puts student_key3

#student_key4 = {}
#school[:students].each

student_names = []
student_names << student_key[:student1].fetch(:name)
student_names << student_key[:student2].fetch(:name)
student_names << student_key[:student3].fetch(:name)
puts student_names

student_names2 = []
student_names2 << school[:students][:student1].assoc(:name)
student_names2 << school[:students][:student2].assoc(:name)
student_names2 << school[:students][:student3].assoc(:name)
student_names2.map {|column| column.delete_at(0)}
student_names2 = student_names2.flatten
puts student_names2 #printing the student's names a different way


school[:rooms].each {|room, details| puts "#{room}'s information: #{details}"}