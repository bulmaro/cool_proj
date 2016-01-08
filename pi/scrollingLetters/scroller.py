import copy
from LED_Matrix_Display import *
from alphabet import *

Display().setup()

def scrollString(string):
  string = string.lower()
  index = 0

  letter_bitmap = [0,0,0,0,0,0,0,0]
  #iterates through the string one char at a time
  while True:
    letter = string[index]
    # add the next letter to the first byte of each row
    for row in range(0,8):
      letter_bitmap[row] = letter_bitmap[row] ^ alpha[letter][row]

    for shift in range(0,8): # shift letter across view
      for i in range(0,len(letter_bitmap)):
        letter_bitmap[i] = letter_bitmap[i]<<1
      showBitmap(letter_bitmap, .04)

    index+=1
    if index >= len(string):
      break

# display the second byte of bitmap 
# given 0xXXXXSSXX I want 0x000000SS
# done by maksing with 0x0000FF00 and shifting 8 right
def showBitmap(bitmap, showFor):
    frames_per_second = 50
    for n in range(0, int(showFor*frames_per_second)):
      for row in range(0,len(bitmap)):
        Display.set_anodes( 1<<row )
        Display.set_cathodes( (bitmap[row] & 0xFF00)>>8 )
        time.sleep(1.0/(len(bitmap)*frames_per_second))

scrollString("Esteban nabetse set bet tab bat nab   battab  ")

