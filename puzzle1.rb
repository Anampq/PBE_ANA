require 'i2c/drivers/lcd'   #Importacion de la libreria i2c y el controlador lcd

def crear_lcd               #Funcion que crea y devuelve un objeto LCD
        return I2C::Drivers::LCD::Display.new('/dev/i2c-1', 0x27, rows = 20, cols = 4)
end

def leer_texto_multilinea   #Funcion que solicita el ingreso de un texto de 4 lineas
        puts 'Ingrese un texto multilinea:'
        texto_multilinea = ''
        4.times do          #Lee cada linea mas un salto de linea y las concatena en una variable
                texto_multilinea += gets.chomp + "\n"
        end
        return texto_multilinea.strip #Elimina el salto de linea adicional al final
end

def escribir_en_lcd(display, texto)    #Funcion que imprime el texto en la lcd
        display.clear
        lineas = texto.split("\n")     #Divide el texto en lineas
        lineas.each_with_index do |linea, index|        #Utiliza un bucle para escribir cada linea en el display
                display.text(linea[0, 20], index)
        end
end

lcd = crear_lcd         #Se crea un objeto lcd
texto_multilinea = leer_texto_multilinea        #Se obtiene un texto multilinea del usuario
escribir_en_lcd(lcd, texto_multilinea)          #Se escribe el anterior texto en la lcd
