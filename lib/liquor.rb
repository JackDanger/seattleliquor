require 'active_support'
require 'nokogiri'

require File.expand_path File.join(File.dirname(__FILE__), '..', 'vendor', 'leviticus/lib/leviticus')


class Liquor < Leviticus::Source

  PriceBook = File.join File.dirname(__FILE__), '..', 'vendor', 'august.html'

  def compile
    parse_html_into_database!
  end

  protected

    def parse_html_into_database!
      @doc = Nokogiri::HTML File.read PriceBook
      current_section = nil
      @doc.xpath("//tr").each_with_index do |node, idx|
        if "Font-size: .80 em" == node['style']
          Drink.new node, :section => current_section, :id => idx
        elsif header = node.css('th.rownobg_pad')
          current_section = header.text
          puts header.text
        end
      end
    end

end

