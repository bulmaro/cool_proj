from LED_Matrix_Display import *
from alphabet import *

# Display.setup()

def scrollString(string):
  string = string.lower()
  index = 0

  display_buffer = [0,0,0,0,0,0,0,0]
  letter = string[index]
  letter_bitmap = alpha[letter]
  print letter_bitmap

  while True:
    print string[index]



    index+=1
    if index >= len(string):
      break

scrollString("Esteban")