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

student_key = {}
student_key.merge!(school[:students].each {|student_id, info| puts "#{student_id}'s information is: #{info}"}) #prints ID and info for every student

#student_key.merge!(school[:students].each_key {|student_no| puts student_no})
#student_key.each_value {|student_info| puts "Information for each student: #{student_info}"}

student_key.merge!(school[:students])
puts student_key[:student1].fetch(:name)

student_names = []
student_names << school[:students][:student1][:name]
student_names << school[:students][:student2][:name]
student_names << school[:students][:student3][:name]
puts student_names

school[:rooms].each {|room, details| puts "#{room}'s information: #{details}"}