module CertificateHelper
  def generate_cert(cn = "GENERATED TEST CERTIFICATE")
    generate_cert_and_key(cn)[0]
  end

  def generate_cert_and_key(cn = "GENERATED TEST CERTIFICATE")
    key = OpenSSL::PKey::RSA.new 2048
    cert = OpenSSL::X509::Certificate.new
    cert.version = 2
    cert.subject = OpenSSL::X509::Name.parse "/DC=org/DC=TEST/CN=#{cn}"
    cert.public_key = key.public_key
    [cert, key]
  end

  def inline_pem(cert)
    Base64.encode64(cert.to_der)
  end
end
