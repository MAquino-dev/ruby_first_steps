require"retriable"

module ReusableMethods

  def search_element(element_name, xpath_name)
    puts "Trying to validate the element #{element_name}"
    Retriable.retriable(on: Timeout::Error, tries: 3, base_interval: 5) do
      element = find(:xpath, $data.dig(xpath_name))
      scroll_to element
      raise StandardError,"Element #{element_name} not found" unless element
    end
  end

  def click_element(element_name, xpath_name)
    puts "Trying to click on the element #{element_name}"
    element = find(:xpath, $data.dig(xpath_name))
    scroll_to element
    response = element.click
    raise StandardError,"Element #{element_name} cannot be clicked" unless response
  end


  def set_value_element(name_element_message, xpath_name, value_set)
    puts "Trying to write to element #{name_element_message}"
    element = find(:xpath, $data.dig(xpath_name))
    response = element.set value_set
    raise StandardError,"Element #{name_element_message} text cannot be set" unless response
  end

  def compare_two_texts(xpath, text)
    puts "Trying to compare element texts"
    comparison = xpath.eql?text
    puts "#{comparison}"
    raise StandardError,"the text is '#{xpath}' and the expected is '#{text}'" unless comparison == false
  end

  def compare_xpath_with_text(name_element_message, xpath, text)
    puts "Trying to validate element text #{name_element_message}"
    element = find(:xpath, $data.dig(xpath))
    capture_text = element.text
    comparison = capture_text.eql?text
    puts "#{comparison}"
    raise StandardError,"the text is '#{capture_text}' and the expected is '#{text}'" unless comparison
  end

  def change_page(position)
    puts "window position"
    page_driver = page.driver.browser
    window = page_driver.window_handles
    page_driver.switch_to.window(window.method(position).call)
  end

  def hover_element(element_name, xpath_name)
    puts "Trying to make a mouse hover on the element #{element_name}"
    element = find(:xpath, $data.dig(xpath_name))
    response = element.hover
    raise StandardError,"Element #{element_name} can't be tagged" unless response
  end
end