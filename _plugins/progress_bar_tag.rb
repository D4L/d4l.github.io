module Jekyll
  class ProgressBarTag < Liquid::Tag

    def initialize( tag_name, text, tokens )
      @label = text.gsub( / \d+.*$/, '')
      @progress = text.split.last
      super
    end

    def render(context)
      "<div class='progress'> \
        <div class='progress-bar' role='progressbar' aria-valuenow='#@progress' aria-valuemin='0' aria-valuemax='100' style='width: #@progress%'> \
          <div class='progress-label'> \
            #@label \
          </div> \
          <span class='sr-only'> \
            #@progress% Completed \
          </span> \
        </div> \
      </div>"
    end

  end
end

Liquid::Template.register_tag('progress_bar', Jekyll::ProgressBarTag )
