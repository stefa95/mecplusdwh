# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


r1 = Role.create({ name: 'Worker', description: 'Può recuperare le voci prenotate; Può caricare materiale in magazzino, Ha accesso alla lista dei materiali presenti in magazzino' })
r2 = Role.create({ name: 'Editor', description: 'Ruoli WORKER; Può rimuovere arbirtrariamente elementi in magazzino; Segna il materiale come prenotato' })
r3 = Role.create({ name: 'Admin', description: 'Ruoli EDITOR; Aggiunge/rimuove gli utenti e imposta i rispettivi ruoli' })