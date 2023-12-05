require_relative 'reusable_methods'
require 'selenium-webdriver'

class Datepicker < SitePrism::Page

  include Capybara::DSL
  include ReusableMethods

  set_url "/Datepicker.html"

  $data = YAML.load(File.read("./data/xpaths.yml"))

  def validate_datepickers
    search_element("DatePicker Enabled Field", "datepicker_two")
    click_element("DatePicker Enabled Field", "datepicker_two")
    has_xpath?($data.dig("pop_up_datepicker"))
    set_value_element('DatePicker Enabled Field', 'datepicker_two', '08/28/2000')
    click_element("DatePicker Enabled text", "datepicker_enabled")

    search_element("DatePicker Disabled Field", "datepicker_one")
    click_element("DatePicker Disabled Field", "datepicker_one")
    has_xpath?($data.dig("day_two_datepicker"))
    execute_script("document.getElementById('datepicker1').value='2023-05-15';")
   #executando um metodo que chama execute script.docuemnt acessa o documento do HTML(site onde pega o xpath)
   #getElementByID ele é um método que busca o elemento pelo ID específico que eu informar no xpath
   #value é o valor que você escreve (data)
   #click_element("DatePicker day two Field", "day_two_datepicker")
   #ELE NÃO VAI SERVIR PARA ELEMENTOS QUE SEJAM DIFERENTES. É funcional em alguns (Id ,class,name)
    sleep 5

   #datepicker_one




    #search_element("Barra de slider", "slider_button")
    #slider = find(:xpath, "//div[@id='slider']/a")
    #slider_width = slider.size.width
    #slider_position = slider.location.x
    #move_right = slider_width * 0.2
    #move_to = slider_position + move_right
    #slider.drag_to(move_right, 0)
  end
end