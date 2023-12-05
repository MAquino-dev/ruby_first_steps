require_relative 'reusable_methods'
require 'selenium-webdriver'
require 'rexml/document'
require 'json'
require 'nokogiri'
require 'site_prism'

class UploadPage < SitePrism::Page

  include Capybara::DSL
  # o capybara dsl fica aqui
  include ReusableMethods

  set_url "/FileUpload.html"

  $data = YAML.load(File.read("./data/xpaths.yml"))

  def validate_upload
    search_element("browse button", "browse_button")
    click_element("browse button", "browse_button")
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    numero_procurado = 6
    array.each do |numero|
      if numero == numero_procurado
        puts "I found the number #{numero_procurado}"
        break
      end
    end

    array = ["Ana", "Maria", "Pedro", "João", "Mário", "Luigi", "Dragão", "Princesa", "Zé", "Yoshi"]
    search_name = "Luigi"
    array.each do |nome|
      if nome == search_name
        puts "I found the name #{search_name}"
        break
      end
    end

    array.each_with_index do |nome, position|
      if nome === search_name
        puts "I found the name #{search_name} in position #{position}"
        break
      end
    end
  end

  #def test_array
    #sleep 1
    #file = File.read('./archives/test_second_array.json')
    #puts file.magenta
#
    #data = JSON.parse(file)
    #puts "Company name:".cyan
    #puts data['empresa'].light_yellow
    #puts "Name of employees:".cyan
    #funcionarios = data['funcionarios']
    #funcionarios.each do |funcionario|
    #  puts funcionario['nome'].light_yellow
    #end
#
    #puts "First officer's department:".cyan
    #primeiro_funcionario = data['funcionarios'][0]
    #departamento = primeiro_funcionario['departamento']['nome']
    #puts departamento.light_yellow
#
    #puts "Ongoing projects:".cyan
    #departamento_desenvolvimento = data['funcionarios'][0]['departamento']
    #projetos_em_andamento = departamento_desenvolvimento['projetos'].select { |projeto| projeto['status'] == 'Em andamento' }
    #num_projetos_em_andamento = projetos_em_andamento.length
    #puts "Número de projetos em andamento no departamento de desenvolvimento: #{num_projetos_em_andamento}".light_yellow
#
    #puts "Position of the second member:".cyan
    #segundo_funcionario = data['funcionarios'][1]
    #segundo_projeto = segundo_funcionario['departamento']['projetos'][1]
    #segundo_membro_equipe = segundo_projeto['equipe'][1]
    #cargo = segundo_membro_equipe['cargo']
    #puts cargo.light_yellow
#
    #puts "Project C employees".cyan
    #projeto_c = data['funcionarios'][1]['departamento']['projetos'].find { |projeto| projeto['nome'] == 'Projeto C' }
    #if projeto_c
    #  equipe_projeto_c = projeto_c['equipe']
    #  equipe_projeto_c.each do |membro|
    #    puts membro['nome'].yellow
    #  end
    #else
    #  puts 'Projeto C não encontrado'.red
    #end
  #end

  # def test_great_restaurant ###########################################
  # sleep 1
  # file = File.read('./archives/great_restaurant.json')
  # guardando a tarefa de ler o arquivo json numa variavel
  # puts file.magenta
  # imprimindo a variável
  #
  # data = JSON.parse(file)
  # fazendo a conversão do arquivo json para o Ruby ler e interpretar, e guardando em uma variável
  # puts "Company name:".cyan
  # imprimindo ...
  # imprimindo ...
  # puts data['nome'].yellow
  # imprimindo o nome do restaurante
  #
  # puts "Name of employees:".cyan
  # imprimindo ...
  # employees = data['funcionarios']
  ## guardando o array com os objetos dentro do data em uma variável
  # employees.each do |funcionario|
  #  procurando em cada objeto do data, dentro da variável 'employees', um funcionario 'outra variavel criada'
  #  puts "name: #{funcionario['nome']}".yellow
  #  puts "position: #{funcionario['funcao']}".yellow
  #  imprimindo funcionario, que agora sabemos que se trata do nome deles. Informação guardada dentro do array
  # end

  # puts "menu of dishes:".cyan
  # dishes = data['cardapio']['pratos']
  # dishes.each do |prato|
  #  puts prato['nome'].yellow
  # end
  #
  # puts "number of elements".cyan
  # puts data.length
  # método imprimindo a quantidade de elementos que existem dentro do array

  # tentativa de arrastar um nome
  # puts "arrastando um funcionario novo (?)".magenta
  # data['funcionarios'].push("José Martins")
  # puts data.length

  # puts data.count
  # puts data.count{|num| num.even?}
  # end

  # def test_funcionaldiades ###########################
  # file = File.read('./archives/projeto.json')
  # puts file.magenta
  #
  # data = JSON.parse(file)
  # sleep 1
  # puts data['empresa']['contato']['email']
  # end
  # end

   def qualquercoisa ######################################
     sleep 1
    file = File.read('./archives/great_restaurant.json')
    # guardando a tarefa de ler o arquivo json numa variavel
    puts file.magenta
    # imprimindo a variável
    data = JSON.parse(file)
    # fazendo a conversão do arquivo json para o Ruby ler e interpretar, e guardando em uma variável
    puts "Company name:".cyan
    puts data['nome'].yellow

    puts "marcando o chef de cozinha ".cyan
    funcionarios_selecionados = data['funcionarios'].select do |funcionario|
      funcionario['funcao'] == 'Chef de Cozinha'
    end
    puts "#{funcionarios_selecionados}".yellow
   end

end

