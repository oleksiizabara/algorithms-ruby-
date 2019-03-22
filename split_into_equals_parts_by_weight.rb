data = [{ file_name: 50, file_size: 50 },
        { file_name: 3, file_size: 3 },
        { file_name: 3, file_size: 3 },
        { file_name: 5, file_size: 5 },
        { file_name: 3, file_size: 3 },
        { file_name: 4, file_size: 4 },
        { file_name: 1, file_size: 1 },
        { file_name: 2, file_size: 2 },
        { file_name: 5, file_size: 5 },
        { file_name: 5, file_size: 5 },
        { file_name: 1, file_size: 1 },
        { file_name: 2, file_size: 2 },
        { file_name: 3, file_size: 3 },
        { file_name: 1, file_size: 1 },
        { file_name: 7, file_size: 7 },
        { file_name: 41, file_size: 41 },
        { file_name: 1, file_size: 1 },
        { file_name: 11, file_size: 11 }]

needed_workers_count = w_count = 4
sum = data.inject(0) { |s, i| s + i[:file_size] }
for_one = (sum / w_count.to_f).ceil

data.sort_by! { |i| i[:file_size] }.reverse!

groups = (1..needed_workers_count).map do
  group = []
  for_delete = []
  current_size = 0
  group.push(data[0][:file_name])
  current_size += data[0][:file_size]
  data.delete_at(0)
  if current_size < for_one
    data.each.with_index do |i, n|
      next if current_size + i[:file_size] > for_one

      group.push(i[:file_name])
      current_size += i[:file_size]
      for_delete.push(n)
      break if current_size >= for_one
    end
  end
  data = data.reject.with_index { |_e, i| for_delete.include? i }
  sum -= sum - data.inject(0) { |s, i| s + i[:file_size] }
  w_count -= 1 if w_count != 1
  for_one = (sum / w_count.to_f).ceil
  group.join(' ')
end

p groups

# ["50", "41", "11 7 5 5 1", "5 4 3 3 3 3 2 2 1 1 1"]