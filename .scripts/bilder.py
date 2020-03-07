import binascii
f = open("hoi4.dmp")
data = binascii.a2b_hex(f.read())
with open('/path/image.jpg', 'wb') as image_file:
    image_file.write(data)
  