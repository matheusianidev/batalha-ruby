class Person
    attr_reader :name, :life 

    def initialize(name, height, age, life = 100)
        @name = name
        @height = height
        @age = age
        @life = life
    end

    def attack(enemy)
        if rand < 0.8 
            damage = rand(5..30) 
            enemy.take_damage(damage)
            puts "#{@name} ataca #{enemy.name} causando #{damage} de dano!"
        else
            puts "#{@name} tentou atacar #{enemy.name}, mas errou!"
        end
    end

    def take_damage(damage)
        @life -= damage
        @life = 0 if @life < 0 # Evita valores negativos
    end
end

# Criando os guerreiros
guerreiro1 = Person.new('Marcos', 1.80, 26)
guerreiro2 = Person.new('Judas', 1.75, 31)

turno = rand(2) # 0 ou 1
primeiro, segundo = turno.zero? ? [guerreiro1, guerreiro2] : [guerreiro2, guerreiro1]

puts "O sorteio definiu que #{primeiro.name} começa a batalha!"
puts "-" * 30 # Separador
sleep(2)

# Loop da batalha
loop do 
    guerreiro1.attack(guerreiro2)
    break if guerreiro2.life <= 0

    guerreiro2.attack(guerreiro1)
    break if guerreiro1.life <= 0

    # Mostra status atual
    puts "#{guerreiro1.name}: #{guerreiro1.life} pontos de vida"
    puts "#{guerreiro2.name}: #{guerreiro2.life} pontos de vida"
    puts "-" * 30 # Separador visual
    sleep(1) # Pequena pausa para facilitar a leitura
end

# Mostra o vencedor
if guerreiro1.life <= 0
    puts "#{guerreiro1.name} caiu em batalha! #{guerreiro2.name} venceu! 🏆"
elsif guerreiro2.life <= 0
    puts "#{guerreiro2.name} caiu em batalha! #{guerreiro1.name} venceu! 🏆"
end
