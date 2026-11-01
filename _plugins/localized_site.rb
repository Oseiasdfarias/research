# Polyglot builds the site once per language. Swap the values the theme reads
# from global config and data, so each build renders in its own language.
Jekyll::Hooks.register :site, :post_read do |site|
  next unless site.respond_to?(:active_lang)

  site.config["lang"] = site.active_lang
  next unless site.active_lang == "pt"

  site.data["cv"] = site.data["cv_pt"]
  %w[description footer_text].each do |key|
    site.config[key] = site.config["#{key}_pt"]
  end
end

# The CV and bibliography gems hard-code English labels and pick their CV
# templates by section name, so the labels are replaced after rendering.
module LocalizedLabels
  CV_HEADINGS = {
    "en" => { "Experience" => "Research Experience" },
    "pt" => {
      "Contact Information" => "Informações de contato",
      "Education" => "Formação",
      "Experience" => "Experiência em pesquisa",
      "Publications" => "Publicações",
    },
  }.freeze

  CV_FIELDS = {
    "Name" => "Nome",
    "Professional Title" => "Título",
    "Email" => "E-mail",
    "Location" => "Localização",
  }.freeze

  PUBLICATION_NOTES = {
    "Accepted" => "Aceito",
    "Draft" => "Rascunho",
    "Preprint in preparation" => "Preprint em preparação",
  }.freeze

  def self.apply(item)
    site = item.site
    return unless site.respond_to?(:active_lang)

    lang = site.active_lang
    output = item.output

    (CV_HEADINGS[lang] || {}).each do |english, translated|
      output = output.gsub(%r{(<h3 class="card-title[^"]*">\s*)#{english}(\s*</h3>)}) { "#{$1}#{translated}#{$2}" }
    end

    if lang == "pt"
      CV_FIELDS.each do |english, translated|
        output = output.gsub("<b>#{english}</b>", "<b>#{translated}</b>")
      end
      output = output.gsub(/(-\s*)Present\b/) { "#{$1}presente" }
      PUBLICATION_NOTES.each do |english, translated|
        output = output.gsub(%r{(<div class="periodical">\s*)#{Regexp.escape(english)}(\s*</div>)}) { "#{$1}#{translated}#{$2}" }
      end
    end

    item.output = output
  end
end

Jekyll::Hooks.register [:pages, :documents], :post_render do |item|
  LocalizedLabels.apply(item) if item.output_ext == ".html"
end
