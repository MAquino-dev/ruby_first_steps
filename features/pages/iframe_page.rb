require_relative "reusable_methods"
class IframePage < SitePrism::Page
  include Capybara::DSL
  include ReusableMethods
  set_url "/Frames.html"

  $data = YAML.load(File.read("./data/xpaths.yml"))

  def validate_iframe_hover
    search_element("Hover em Single Iframe", "single_iframe")
    hover_element("Hover em Single Iframe", "single_iframe")
    hover_element("Hover em Iframe with in an Iframe", "iframe_in_other_iframe")
  end

  def validate_iframe_function
    within_frame find(:xpath, $data.dig("tab_one_iframe")) do
      compare_xpath_with_text("iframe da primeira aba", "iframe_name", "iFrame Demo")
      set_value_element("Caixa de texto", "first_textbox", "Vários Passos")
    end
  end

  def validate_second_frame
    search_element("Botão frame with in an Iframe", "iframe_in_other_iframe")
    click_element("Botão frame with in an Iframe", "iframe_in_other_iframe")
    within_frame find(:xpath, $data.dig("tab_two_iframe1")) do
      compare_xpath_with_text("Primeiro iframe da segunda aba", "second_iframe_name1", "Nested iFrames")
      within_frame find(:xpath, $data.dig("tab_two_iframe2")) do
        compare_xpath_with_text("Segundo iframe da segunda aba", "iframe_name", "iFrame Demo")
        set_value_element("Segunda caixa de texto", "second_textbox", "Praticando digitar em iframes")
        sleep 5
      end
    end
  end
end
