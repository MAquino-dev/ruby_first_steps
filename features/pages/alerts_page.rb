require_relative "reusable_methods"
require "selenium-webdriver"

class AlertPage < SitePrism::Page
  include ReusableMethods
  set_url "/Alerts.html"

  $data = YAML.load(File.read('./data/xpaths.yml'))

  def validate_function_hover
    puts "Validating how hover works on buttons"
    search_element("Alert with ok", "alert_ok")
    hover_element("Hover em Alert with ok", "alert_ok")
    hover_element("Hover em Alert ok and cancel", "alert_ok_and_cancel")
    hover_element("Hover em Alert and textbox", "alert_textbox")
  end

  def validate_first_alert
    puts "Testing the operation of 'alerts'"
    search_element("Alert With Ok button", "alert_box")
    click_element("Alert With Ok button", "alert_box")
    accept_alert{}
    sleep 2
    click_element("Alert with OK and Cancel", "alert_ok_and_cancel")
    search_element("Alert box button", "confirm_box")
    click_element("Alert box button", "confirm_box")
    dismiss_confirm{}
    #accept_alert{}
    sleep 2
    click_element("Alert with Textbox", "alert_textbox")
    search_element("Alert box Textbox", "prompt_box")
    click_element("Alert box Textbox", "prompt_box")
    accept_prompt(with: "Matias Sanchez")
    sleep 3
  end
end