## Задача №3:
#
# Джон добрался до этажа с бомбой, но у него на пути стоит дверь с кодовым замком и рядом бумажка с инструкциями (файл data/3.txt)
#
# Чтобы узнать код от замка, ему нужно для каждой строки найти разницу между наибольшим и наименьшим числами и потом сложить полученные значения
#
## Требования к решению:
# - Входные данные находятся в файле data/3.txt (разделитель значений - символ табуляции)
# - Результат должен быть выведен в консоль командой puts
#
## Решение:

mode = "r"
file = File.open("data/3.txt", mode)
a = file.read
s = 0
IO.foreach("data/3.txt") do |line|
  temp = line.split(' ')
  maxi = temp[0].to_i
  mini = temp[0].to_i
  for i in 0..(temp.length - 1)
    if temp[i].to_i < mini
      mini = temp[i].to_i
    end
    if temp[i].to_i > maxi
      maxi = temp[i].to_i
    end
  end
  s += maxi - mini
end
file.close

puts s


