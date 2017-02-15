
# Pseudocode

1. input un arreglo de numeros
2. iterar sobre el arreglo
3. crear un variable  voy a ir guardando el mas pen
3. en cada iteracion comparar el elemento con

#Definicion
def find_minimun(array)
  return nil if array.length == 0
  count = array.first
  array.each.with_index do |n, index|
    if index == 0
      count = n
    else
      if n < count
        count = n
      end
    end
  end
  count
end

def find_minimun(arr)
  return nil if arr.length == 0
  count = array.first
  arr.each do |n|
    if n < count
      count = n
    end
  end
  count
end

rangos[:temperature] = temperature
rangos[:altitude] = altitude
rangos[:pressure] = pressure

# Invocar (Usar el metodo)

say_name('juan') # => 'Juan'
say_name(3) # => 3
say_name('fbasdjkfl ') # => fdksal;

find_minimun([1,2,3,4,5,6])


Flujo de git

// Trabajo solo en mi repo
1. Te paras en mi repo local (ruby-intro)
2. mirar git status
3. limpiar el working directory
  - git add .
  - git commit -m'Buen mensaje'
4. git push origin master (actualizar repo remoto)

// Actualizar Origin con Upstream
5. **Suponiendo que ya hicimos**
  - git remote add upstream <url de de upstream>
6. git fetch upstream master
7. git merge upstream/master (resolver conflictos)



separate_comma(1000)    # => "1,000"
separate_comma(1000000) # => "1,000,000"
separate_comma(0)       # => "0"
separate_comma(100)     # => "100




soccer_leagues[0][:teams][0][:real_madrid][:players]

soccer_leagues = [
  {
    name: 'Spanish League',
    teams: [
      {
        real_madrid: {
          players: ['ronaldo', 'james']
        }
      },
      {
        barcelona: {
          players: ['messi', 'shakiro']
        }
      }
    ],
  },
  {
    name: 'Premier League',
    teams: [
      {
        chelsea: {
          players: ['hazar', 'costa']
        }
      },
      {
        liverpool: {
          players: ['miller', 'gerard']
        }
      }
    ],
  }
]

soccer_leagues.each do |league|
  teams_template = league[:teams].map do |teamHash|
    "#{teamHash.keys.join('')} con jugadores #{teamHash[teamHash.keys.first][:players].join(' ')}"
  end
  puts "Los equipos de la #{league[:name]} son #{teams_template.join(' ')}"
end


{
    name: 'Premier League',
    teams: [
      {
        chelsea: {
          players: ['hazar', 'costa']
        }
      },
      {
        liverpool: {
          players: ['miller', 'gerard']
        }
      }
    ],
  }






occer_leagues.each do |league|
  p "Los equipos de la #{league[:name]} son:"

 league[:teams].each do |name|

    name.each do |key, value|
      p "#{key} y sus jugadores son:"

     value[:players].each do |player_name|
        p "#{player_name}"
      end
    end
  end
end

soccer_leagues.each do |nombre|
  nombre[:teams].each do |equipo|
      puts "Los equipos de la #{nombre[:name]}
      son #{equipo.flatten[0]} y los jugadores son
       #{equipo.flatten[1][:players].join(",")}"
  end
end
