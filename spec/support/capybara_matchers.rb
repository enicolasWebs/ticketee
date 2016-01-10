module CapybaraMatchers
    def has_heading?(text)
        has_css?("h1, h2, h3, h4, h5, h6", text: text)
    end
end

self.class.class_eval do
    Capybara::Session.include(CapybaraMatchers)
end
