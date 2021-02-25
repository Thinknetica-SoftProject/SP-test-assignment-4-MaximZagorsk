## Задача №4:
#
# В соседнем районе рождественские эльфы готовят подарки для жителей города.
# Для каждого подарка (файл data/4.txt) нужно найти сколько оберточной бумаги потребуется.
# Формула рассчета: 2*ш*д + 2*д*в + 2*в*ш + площадь наименьшей стороны
# Например, на подарок размером 2х3х4 требуется 2*6 + 2*12 + 2*8 = 52 + 6 кв. см.
#
# Сколько всего оберточной бумаги нужно купить эльфам?
#
## Требования к решению:
# - Входные данные находятся в файле data/4.txt
# - В значениях данные длины, ширины и высоты не упорядочены и могут идти в любом порядке, однако
# длина всегда наименьшее число из трех, высота - среднее, ширина - самое большое.
# - Результат должен быть выведен в консоль командой puts
#
#
## Решение:

# Функция поиска длины, высоты, ширины
def length_height_width(a)
  a = a.split('x')
  mn=0
  mx=0
  min = a[0].to_i
  max = a[0].to_i
  for i in 0..(a.length - 1)
    if a[i].to_i < min
      min = a[i].to_i
      mn = i
    end
  end
  for i in 0..(a.length - 1)
    if a[i].to_i > max
      max = a[i].to_i
      mx = i
    end
  end
  for i in 0..(a.length - 1)
    if i != mn  and i != mx
      aver = a[i].to_i
    end
  end
  lhw = [min, aver, max]
  return  lhw
end

# Функция вычисления оберточной бумаги на один подарок
def calculation_of_paper(a)
  length = a[0]
  height = a[1]
  width = a[2]
  cop = 2*width*length + 2*length*height + 2*height*width + length*height
  return cop
end

mode = "r"
file = File.open("data/4.txt", mode)
s = 0
i= 1
IO.foreach("data/4.txt") do |line|
  lhw = length_height_width(line)
  s= s + calculation_of_paper(lhw)
  i +=1
end
file.close

# Вывод сколько понадобиться оберточной бумаги
puts s

