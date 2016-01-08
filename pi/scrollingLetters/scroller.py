import copy
from LED_Matrix_Display import *
from alphabet import *

Display().setup()

def scrollString(string):
  string = string.lower()
  index = 0

  #iterates through the string one char at a time
  while True:
    letter = string[index]
    letter_bitmap = copy.deepcopy(alpha[letter])

    for shift in range(0,8):
      for i in range(0,len(letter_bitmap)):
        letter_bitmap[i] = letter_bitmap[i]<<shift
      showBitmap(letter_bitmap, .1)
    index+=1
    if index >= len(string):
      break

def showBitmap(bitmap, showFor):
    frames_per_second = 50
    for n in range(0, int(showFor*frames_per_second)):
      for row in range(0,len(bitmap)):
        Display.set_anodes( 1<<row )
        Display.set_cathodes( bitmap[row] )
        time.sleep(1.0/(len(bitmap)*frames_per_second))

scrollString("Esteban")
