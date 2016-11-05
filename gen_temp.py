low=300
high=400
num=64


print '#', low, high, num

delta=high-low
bin=float(delta)/float(num)

print '#', delta, bin

for i in xrange(0,num):
  print low+i*bin
