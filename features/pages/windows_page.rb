require_relative "reusable_methods"
class WindowsPage < SitePrism::Page
  include Capybara::DSL
  include ReusableMethods
  set_url "/Windows.html"

  $data = YAML.load(File.read("./data/xpaths.yml"))

  def validate_window_hover
    search_element("Hover em Open New Tabbed Windows", "tabbed_window")
    hover_element("Hover em Open New Tabbed Windows", "tabbed_window")
    hover_element("Hover em Open New Separate Windows", "separate_window")
    hover_element("Hover em Open Separate Multiple Windows", "multiple_window")
    sleep 2
  end

  def validate_windows_function
    click_element("Botão de click para abrir uma guia", "tabbed_window_button")
    sleep 2
    windows.last
    #Esse comando vai para a última tab
    sleep 3
    change_page("first")
    click_element("Botão de click para abrir uma guia", "tabbed_window_button")
    sleep 2
    change_page("last")
   # click_element("Botão de click para abrir uma guia", "tabbed_window_button")
   # sleep 2
   # change_page("first")
   # click_element("Botão de click para abrir uma guia", "tabbed_window_button")
   # sleep 2
   # change_page("first")
   # #Esse é o método reutilizável que vai para qual tab que a gente quiser.
   # sleep 3
   # change_page("last")
    #TODO PESQUISAR COMO TROCAR DE TAB SE TIVER MAIS DE 4 TABS
    sleep 2

  end

end
