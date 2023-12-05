require_relative 'reusable_methods'
require 'selenium-webdriver'

class ModalPage < SitePrism::Page
  include Capybara::DSL
  include ReusableMethods
  22
  set_url "/Modals.html"

  $data = YAML.load(File.read("./data/xpaths.yml"))

  def validate_modal_function
    search_element("Bootstrap modal button", "bootstrap_modal")
    click_element('Bootstrap modal button', 'bootstrap_modal')
    within find(:xpath, $data.dig('first_modal')) do
      has_text? "Fusce"
      click_element('close first modal button', 'close_first_modal')
    end

    search_element("multiple modals button", "multiple_modals")
    click_element('multiple modals button', 'multiple_modals')
    within find(:xpath, $data.dig('second_modal')) do
      has_text? "second"
      search_element("launch modal button", "launch_modal")
      click_element('launch modal button', 'launch_modal')
      within find(:xpath, $data.dig('third_modal'))do
        has_text? "Modal 2"
        search_element("close third modal button", "close_third_modal")
        click_element('close third modal button', 'close_third_modal')
      end
      search_element("close second modal button", "close_second_modal")
      click_element('close second modal button', 'close_second_modal')
    end
  end
end