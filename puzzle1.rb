require 'i2c/drivers/lcd'

# Creo una nueva funcion que inicializa el lcd y me procesa un string
def escribir_en_lcd(texto)
  display = I2C::Drivers::LCD::Display.new('/dev/i2c-1', 0x27, rows = 20, cols = 4)
  display.clear
# Si la longitud del string es inferior a 20 caracteres los escribe en la linea 0
  if texto.length <= 20
    display.text(texto, 0)
# Si la long es superior que escriba en las siguientes lineas
  else
    display.text(texto[0, 20], 0)
    display.text(texto[20..40], 1)
    display.text(texto[40..60], 2)
    display.text(texto[60..-1], 3)
  end
end

puts 'Ingrese un texto:'
input_texto = gets.chomp

escribir_en_lcd(input_texto)
