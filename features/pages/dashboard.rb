require_relative "reusable_methods"
require 'headless'

class Dashboard < SitePrism::Page33
  include Capybara::DSL
  include ReusableMethods
  set_url "/Register.html"

  $data = YAML.load(File.read('./data/xpaths.yml'))

  def validate_and_fill_form
    puts "Validate and set information in the formulary".green

    search_element("Name", "first_name")
    set_value_element("Name", "first_name", "Matias")

    puts "Fetch the Last Name Element"
    set_value_element("Surname", "last_name", "Sanchez")

    puts "Search for the Phone Element and type the phone"
    set_value_element("Enter Phone", "phone", "91621137")

    puts "Search for the Email Element and enter the email"
    set_value_element("Enter Email", "email", "test@test.com")

    puts "Select male gender"
    click_element("Genre button", "male")

    puts "Select Hobbies that are in the checkbox"
    click_element("Movies button", "movies")

    # puts "Select the country"
    # click_element("Select Country", "select_country")
    # set_value_element("enter the country", "country_box", "Japan")
    # click_element("Set Country", "japan")

    puts "Browse and select the Year button (Dropdown)"
    click_element("choose year", "year")
    click_element("Select the year", "select_year")

    puts "Fetch and select the Month button (Dropdown)"
    click_element("choose month", "month")
    click_element("Select the month", "select_month")

    puts "Fetch and select the Day button (Dropdown)"
    click_element("choose day", "day")
    click_element("Select the day", "select_day")

    puts "enter the password"
    set_value_element("enter password", "password", "123")

    puts "Confirm the password"
    set_value_element("confirm password", "password2", "123")

    puts "Search and select the language (Dropdown)"
    set_value_element("search language", "language", "Portuguese")
  end

  def validate_input_operation
    click_element("skill button", "skill")
    click_element("skill select button", "ruby")
  end
end