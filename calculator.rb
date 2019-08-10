puts "input waiting..."
input = gets # 標準入力を受け付ける
inputs = input.split(" ")
inputs = inputs.map{|i| i.to_i}
arrival_time = inputs.shift #設定温度到達までの時間
puts "合計時間:#{inputs.inject(:+)}"
odd = inputs.each_slice(2).map(&:first)

if arrival_time < inputs.inject(:+)
  default_cost = 0.2 * ((inputs.inject(:+) - arrival_time)) + 0.8 * arrival_time
else
  default_cost= 0.8 * inputs.inject(:+)
end

puts "default_cost:#{default_cost}"

cost = 0
odd.each do |od|
  if arrival_time <= od
    cost += 0.8 * arrival_time
    cost += 0.2 * (od - arrival_time)
  else
    cost += 0.8 * od
  end
end

puts "cost:#{cost}"

result = cost <= default_cost

input = gets
input.chomp == 'answer' # inputには改行文字が含まれているためchompしています

puts result

#エアコン消したら一瞬で熱くなる？
