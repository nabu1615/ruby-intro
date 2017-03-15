# Simple String Methods

# Tu solucion abajo:

old_string = "Ruby is cool"
new_string = old_string.upcase
new_string = new_string.reverse 

# Pruebas NO LAS BORRES


describe "old_string" do
  it 'is defined as a local variable' do
    expect(defined?(old_string)).to eq 'local-variable'
  end

  it "has the value 'Ruby is cool'" do
    expect(old_string).to eq "Ruby is cool"
  end
end

describe 'new_string' do
  it 'is defined as a local variable' do
    expect(defined?(new_string)).to eq 'local-variable'
  end

  it 'has the value "LOOC SI YBUR"' do
    expect(new_string).to eq "LOOC SI YBUR"
  end
end


# Escriban un progrma que le pregunte al usuario por su primer nombre, luego el apellido y luego que imprima una oracion que diga "Hola <nombre> <apellido> como estas"
