# frozen_string_literal: true

class Tag
  def self.build(tag, args = {})
    attr_string = args.map { |(k, v)| " #{k}=\"#{v}\"" }.join
    if block_given?
      "<#{tag}#{attr_string}>#{yield}</#{tag}>"
    else
      "<#{tag}#{attr_string}>"
    end
  end
end
