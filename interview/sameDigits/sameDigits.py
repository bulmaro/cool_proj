# Find the smallest number n whose multiples are 2n, 3n, 4n, 5n and 6n are anagrams of the digits of n.
import time

def bruteForce(ceiling):
  for n in range(1,ceiling):
    # should skip numbers that first two digits are greater than 16, because they when multiplied by 6 will gain a new digit
    #if( str(n)[0] > str(1)[0] ):
    #  continue
    if (containSameDigits(n, n*2, n*3, n*4, n*5, n*6)):
      print n
      break

def containSameDigits(n1, n2, n3, n4, n5, n6):
  number1 = str(n1)
  number2 = str(n2)
  number3 = str(n3)
  number4 = str(n4)
  number5 = str(n5)
  number6 = str(n6)
  # if the length of the strings is not the same then they can't be anagrams
  if not ( len(number1) == len(number2) == len(number3) == len(number4) == len(number5) == len(number6) ):
    return False
  if ( set(number1) == set (number2) == set(number3) == set(number4) == set(number5) == set(number6) ):
    return True
  return False

print("Result:")
start = time.time()
bruteForce(10000000)
elapsed = time.time() - start
print("Found in: %s seconds" % elapsed)