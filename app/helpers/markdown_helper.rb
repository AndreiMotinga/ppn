require "redcarpet"
require "redcarpet/render_strip"

module MarkdownHelper
  def markdown(text)
    options = {
      autolink: true,
    }
    md = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    md.render(text).html_safe
  end
end
