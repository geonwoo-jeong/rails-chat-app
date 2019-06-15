require 'csv'

csv = CSV.read('db/fixtures/development/01_user.csv')

csv.each do |csv|
    User.seed do |seed|
        seed.username = csv[0]
        seed.password = csv[1]
    end
end