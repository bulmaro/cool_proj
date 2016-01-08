from LED_Matrix_Display import *
from alphabet import *

# Display.setup()

def scrollString(string):
  string = string.lower()
  index = 0

  #iterates through the string one char at a time
  while True:
    letter = string[index]
    letter_bitmap = alpha[letter]

    for shift in range(0,8):
      frames_per_second = 50
      showFor = 1
      for n in range(0, int(showFor*frames_per_second)):
        for row in range(0,len(letter_bitmap)):
          Display().set_anodes(1<<row)
          Display().set_cathodes( letter_bitmap[row]<<shift )
          time.sleep(1.0/(len(bitmap)*frames_per_second))

    index+=1
    if index >= len(string):
      break

def showBitmap(bitmap, showFor):
    frames_per_second = 50
    for n in range(0, int(showFor*frames_per_second)):
      for row in range(0,len(bitmap)):
        set_anodes( 1<<row )
        set_cathodes( bitmap[row] )
        time.sleep(1.0/(len(bitmap)*frames_per_second))

scrollString("Esteban")
