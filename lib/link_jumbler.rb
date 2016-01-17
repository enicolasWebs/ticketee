require 'nokogiri'

class LinkJumbler
    def initialize(app, letters)
        @app = app
        @letters = letters
    end

    def call(env)
        status, headers, response = @app.call(env)

        if not response.instance_of? Array
            @body = Nokogiri::HTML::fragment(response.body.to_s)
            @body.css("a").each do |a|
                @letters.each do |find, replace|
                    a.content = a.content.gsub(find.to_s, replace.to_s)
                end
            end

            @str = @sbody.to_s.encode!("UTF-8")
            [status, headers, [@str]]
        end
        [status, headers, response]
    end
end
