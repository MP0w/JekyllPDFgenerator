module Jekyll
    PDF_DIR = File.expand_path("../", __FILE__)+'/../'

    Jekyll::Hooks.register :pages, :post_render do |page|
        if page.data.has_key?('isPDF')
            system("weasyprint http://0.0.0.0:4000#{page.url} #{PDF_DIR}#{page.data['PDFTitle']}.pdf")
        end
    end
end
