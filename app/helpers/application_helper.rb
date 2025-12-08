module ApplicationHelper
  def nav_link_to(text, path, icon: nil, **options)
    is_active = current_page?(path)
    
    base_classes = if is_active
      "flex items-center gap-3 px-4 py-3 rounded-lg bg-[#292524] text-amber-500 transition-all w-full xl:w-auto"
    else
      "flex items-center gap-3 px-4 py-3 rounded-lg text-[#a8a29e] hover:text-amber-500 hover:bg-[#292524]/50 transition-all w-full xl:w-auto"
    end

    # Merge passed classes with base classes
    options[:class] = "#{base_classes} #{options[:class]}".strip

    link_to path, options do
      concat(lucide_icon(icon, class: "w-5 h-5")) if icon
      concat(tag.span(text, class: "font-medium"))
    end
  end
  def markdown(text)
    Commonmarker.to_html(text.to_s).html_safe
  end
end
