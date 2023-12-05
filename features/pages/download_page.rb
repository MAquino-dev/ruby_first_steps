require_relative 'reusable_methods'
require 'selenium-webdriver'
require 'fileutils'
require 'rspec/expectations'

class DownloadPage < SitePrism::Page
  include Capybara::DSL
  include ReusableMethods

  set_url "/FileDownload.html"

  $data = YAML.load(File.read("./data/xpaths.yml"))
  $text_pdf = YAML.load(File.read("./data/pdf.yml"))

  def validate_downloads
    ##puts "Clicar no botão de download"
    ##search_element("Botão de Download", "download_button")
    ##click_element("Botão de Download", "download_button")
    #search_element("Primeira Caixa de texto", "text_box_txt")
    #set_value_element("Primeira Caixa de texto", "text_box_txt", $text_pdf.dig("txt_text"))
    #search_element("Botão de criar texto txt", "create_text")
    #click_element("Botão de criar texto txt", "create_text")
    #search_element("Botão de download do arquivo txt", "download_txt")
    #click_element("Botão de download do arquivo txt", "download_txt")
#
    ## SALVA O ARQUIVO TXT BAIXADO NA PASTA ARCHIVES E FAZ A LEITURA DELE, E VERIFICA SE TEM O TEXTO 'Um que a sua falta se deveu a'
    ## Aguarda o download ser concluído
    #downloaded_file = nil
    #while downloaded_file.nil? || !File.exist?(downloaded_file) do
    #  sleep 1
    #  downloaded_file = Dir["#{$path}/*.txt"].max_by { |f| File.mtime(f) }
    #end
#
    ## Move o arquivo para a pasta "archives" com o nome "test.txt"
    #FileUtils.mv(downloaded_file, 'archives/nice.txt')
#
    ## Lê o conteúdo do arquivo e verifica se contém a string "Um que a sua falta se deveu a"
    #txt_content = File.read('archives/nice.txt')
    #if txt_content.include?('Um que a sua falta')
    #  puts "O arquivo contém a string ."
    #else
    #  puts "O arquivo NÃO contém a string ."
    #end

    #search_element("Segunda caixa de texto", "text_box_pdf")
    #set_value_element("Segunda caixa de texto", "text_box_pdf", $text_pdf.dig("pdf_text"))
    #search_element("Botão de criar texto PDF", "create_pdf")
    #click_element("Botão de criar texto PDF", "create_pdf")
    #search_element("Botão de download do arquivo PDF", "download_pdf")
    #click_element("Botão de download do arquivo PDF", "download_pdf")
    #downloaded_file = Dir["#{$path}/*.pdf"].max_by { |f| File.mtime(f) }
    #pdf_content = File.read(downloaded_file)

    ## Altere o nome do arquivo para 'test.pdf' e mova-o para a pasta 'archives'
    #FileUtils.mv(downloaded_file, 'archives/samplefile.pdf')

    # Abre o arquivo PDF para leitura
    reader = PDF::Reader.new('archives/samplefile.pdf')

    # Verifica se o arquivo PDF contém a palavra "COV"
    if reader.pages.any? { |page| page.text.include?('themselves') }
      puts "The PDF file contains the word 'themselves'."
    else
      raise StandardError "The specified text DOES NOT CONTAIN in the file"
    end
  end
end