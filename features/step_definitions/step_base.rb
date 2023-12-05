Given("that the user accesses the test site") do
  puts "Accessing the test site".green
  @dashboard = Dashboard.new
  @dashboard.load
end

When("it validates and fills in the form fields") do
  puts "Validating forms".green
  @dashboard.validate_and_fill_form
end

Then("validated the operation of the buttons") do
  puts "Validating button functionality".green
  @dashboard.validate_input_operation
end


Given("that the user accesses the alerts test site") do
  puts "Testing all alert buttons".green
  @alerts_page = AlertPage.new
  @alerts_page.load
end

When("validates and that the hover works on the buttons") do
  puts "Performing mouse hover on elements".green
  @alerts_page.validate_function_hover
end

Then("validate the first alert") do
  puts "Validating the first alert".green
  @alerts_page.validate_first_alert
end


Given("that the user accesses the windows test site") do
  puts "Accessing the test site from the windows tab".green
  @windows_page = WindowsPage.new
  @windows_page.load
end

When("validates and that the hover is working on the buttons") do
  puts "Testing how hover works in windows".green
  @windows_page.validate_window_hover
end

Then("validate the first window") do
  puts "Validating the operation of the window".green
  @windows_page.validate_windows_function
end


Given("that the user accesses the iframe test site") do
  puts "accessing the test site in the iframe tab".green
  @iframe_page = IframePage.new
  @iframe_page.load
end

When("validates and that the hover is working") do
  puts "Testing hover in iframes".green
  @iframe_page.validate_iframe_hover
end

And("validates that the iframe and its content") do
  puts "Validating iframe content".green
  @iframe_page.validate_iframe_function
end

Then("validates the second tab of the second iframe") do
  puts "Validating the content of the second iframe".green
  @iframe_page.validate_second_frame
end


Given("that the user accesses the test site on the drag and drop page") do
  puts "Accessing the test site in the drag and drop tab".green
  @drag_and_drop_page = DragAndDropPage.new
  @drag_and_drop_page.load
end

Then("it drags the images and validates that the drag and drop is working") do
  puts "testing and validating drag and drop".green
  @drag_and_drop_page.validate_drag_and_drop_button
end


Given("that the user accesses the test site on the datepicker page") do
  puts "Accessing the test site in the datepicker tab".green
  @datepicker_page = Datepicker.new
  @datepicker_page.load
end

Then("it validates the page datepickers") do
  puts "validating the page datepickers".green
  @datepicker_page.validate_datepickers
end

Given("that the user accesses the modal test site") do
  puts "Accessing the test site in the modal tab".green
  @modal_page = ModalPage.new
  @modal_page.load
end

When("validates that the modal and its content") do
  puts "Validating the content of the modal".green
  @modal_page.validate_modal_function
end


Given("that the user accesses the test site on the slider page") do
  puts "Accessing the test site in the slider tab".green
  @slider_page = SliderPage.new
  @slider_page.load
end

Then("it validates the page slider button") do
  puts "validating slider button".green
  @slider_page.validate_slider_button
end

Given("that the user accesses the download test site") do
  puts "Accessing the test site from the download tab".green
  @download_page = DownloadPage.new
  @download_page.load
end

Then("validates that the downloads are working") do
  puts "testing the functioning of the downloads".green
  @download_page.validate_downloads
end


Given("that the user accesses the upload test site") do
  puts "Accessing the test site from the upload tab".green
  @upload_page = UploadPage.new
  @upload_page.load
end

When("validates that the upload is working") do
  puts "validating the operation of the upload".green
  @upload_page.qualquercoisa
  #@upload_page.validate_upload
end