class Pokemon

    attr_accessor :name, :type, :id, :db

    def initialize(id:, name:, type:, db:)
        @id = id 
        @name = name 
        @type = type 
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type) values (?, ?)
        SQL

        db.execute(sql, name, type)

    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon
            WHERE id = ?
            SQL
        
        picachu = db.execute(sql, id)

        raichu = Pokemon.new(id: id, name: picachu[0][1], type: picachu[0][2], db: db)

        raichu
    end

end
