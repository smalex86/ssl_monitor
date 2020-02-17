class AddUniqueDomainIndexIntoCertificates < ActiveRecord::Migration[6.0]
  def up
    add_index :certificates, :domain, unique: true
  end
  def down
    remove_index :certificates, name: 'index_certificates_on_domain'
  end
end
