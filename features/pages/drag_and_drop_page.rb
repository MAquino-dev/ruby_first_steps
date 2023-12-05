require_relative "reusable_methods"
require 'selenium-webdriver'

class DragAndDropPage < SitePrism::Page
  include Capybara::DSL
  include ReusableMethods

  set_url "/Static.html"

  $data = YAML.load(File.read("./data/xpaths.yml"))

  def validate_drag_and_drop_button
    first_logo = find(:xpath, $data.dig("logo_one"))
    #variavel onde guarda uma xpath
    drop_area = find(:xpath, $data.dig("drop_area"))
    #variavel da drop area
    first_logo.drag_to(drop_area)
    #arrastando o xpath até a drop area e o deixa lá
    sleep 3
    element = has_xpath?($data.dig("logo_in_drop_area"))
    #pra verificar se o xpath está realmente lá
    puts "#{element}"
    raise StandardError,"Elemento não encontrado" unless element
    ############################################### quando se tem só a variável ele interpreta como TRUE por padrão

    second_logo = find(:xpath, $data.dig("logo_two"))
    drop_area_two = find(:xpath, $data.dig("drop_area"))
    second_logo.drag_to(drop_area_two)
    second_element = has_xpath?($data.dig("second_logo_in_drop_area"))
    puts "#{second_element}"
    raise StandardError,"Elemento não encontrado" unless second_element

    third_logo = find(:xpath, $data.dig("logo_three"))
    drop_area_three = find(:xpath, $data.dig("drop_area"))
    third_logo.drag_to(drop_area_three)
    third_element = has_xpath?($data.dig("third_logo_in_drop_area"))
    puts "#{third_element}"
    raise StandardError,"Elemento não encontrado" unless third_element
    sleep 3
  end
end