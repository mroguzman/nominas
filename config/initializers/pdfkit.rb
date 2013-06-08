PDFKit.configure do |config|
  if Rails.env.production? || Rails.env.staging?
    config.wkhtmltopdf = Rails.root.join("vendor", "bin", "wkhtmltopdf-amd64").to_s
  end
end
