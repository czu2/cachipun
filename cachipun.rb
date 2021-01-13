require 'io/console'

## Menú Principal
def menu(gamer)
    options = [1,2,3]
    system('clear')
    puts '
    *------------------------------------------*
           DESAFÍO PIEDRA, PAPEL o TIJERA 
    *------------------------------------------*

             == JUGADOR NÚMERO '+ gamer +' ==

                    1. Piedra
                    2. Papel
                    3. Tijeras

                    4. Salir

    *------------------------------------------*'
    print '           Opción Jugador Número '+ gamer +': '
    menu_op = gets.to_i
    salir() if menu_op == 4

    if options.include? (menu_op)
        return menu_op
    else
        no_opcion(gamer)
    end
end

## Juego
def juego(j1, j2)

    case j1
        when 1
            g1 = 'Piedra'
        when 2
            g1 = 'Papel'
        when 3
            g1 = 'Tijeras'
    end

    case j2
        when 1
            g2 = 'Piedra'
        when 2
            g2 = 'Papel'
        when 3
            g2 = 'Tijeras'
    end

    case g1
        when 'Piedra'
            res = 'DOS' if g2 == 'Papel'
            res = 'UNO' if g2 == 'Tijeras'
        when 'Papel'
            res = 'UNO' if g2 == 'Piedra'
            res = 'DOS' if g2 == 'Tijeras'
        when 'Tijeras'
            res = 'UNO' if g2 == 'Papel'
            res = 'DOS' if g2 == 'Piedra'
    end

    res = 'EMPATE' if g1 == g2
    resultado(g1, g2, res) 
end

## Imprime Resultado
def resultado(game1, game2, res)
    system('clear')

    puts "*---------------------------------------------------------*"
    puts "   Jugador UNO: #{game1}     V/S     Jugador DOS: #{game2} "
    puts "*---------------------------------------------------------*"

    if res == 'EMPATE'
        puts "\n\n                    ===  #{res}  ==="
    else
        puts "\n\n             EL GANADOR ES EL JUGADOR NÚMERO"
        puts "                    ===  #{res}  ==="
    end

    puts "\n\n*---------------------------------------------------------*"
    print "\n\nPresione cualquier tecla para terminar..."
    STDIN.getch
    salir()
end

## Opción NO Válida
def no_opcion(gamer)
    system('clear')
    puts '*---------------------------------------------------------*'
    puts "                     JUGADOR NÚMERO #{gamer} \n"
    print '*---------------------------------------------------------*
      _____
      \ ! /    
       \ /        ¡LA OPCIÓN SELECCIONADA NO ES VÁLIDA!
    ¡ALERTA!'
    puts "\n\n*---------------------------------------------------------*"

    print "\n\nPresione cualquier tecla para continuar..."
    STDIN.getch
    menu(gamer)
end

## Salir
def salir
    puts "\nSaliendo..."
    sleep(1)
    system('clear')
    exit()
end

## Main
op1 = menu('UNO')
op2 = menu('DOS')
juego(op1, op2)
