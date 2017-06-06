require("pg")

class BountyHunter
  attr_accessor :name, :species, :bounty_value, :danger_level
  def initialize(options)
    @name = options["name"]
    @species = options["species"]
    @bounty_value = options["bounty_value"].to_i()
    @danger_level = options["danger_level"]
    @id = options["id"].to_i() if options["id"]
  end

  def save()
    db = PG.connect({dbname: "bounty_hunter", host: "localhost"})
    sql = "INSERT INTO bounty_properties (
    name,
    species,
    bounty_value,
    danger_level
    )
    VALUES (
    '#{@name}',
    '#{@species}',
    #{@bounty_value},
    '#{@danger_level}'
    ) RETURNING id"
    @id = db.exec(sql)[0]["id"].to_i()
    db.close()
  end

  def update()
    db = PG.connect ({dbname: "bounty_hunter", host: "localhost"})
    sql = "UPDATE bounty_properties
    SET(
    name,
    species,
    bounty_value,
    danger_level
    ) =
   (
    '#{@name}',
    '#{@species}',
    '#{@bounty_value}',
    '#{@danger_level}'
    ) WHERE id = #{@id}"

    db.exec(sql)
    db.close()
  end

  def delete()
    db = PG.connect({dbname: "bounty_hunter", host: "localhost"})
    sql = "DELETE FROM bounty_properties WHERE id = #{@id}"
    db.exec(sql)
    db.close()
  end

  def BountyHunter.find(name)
    db = PG.connect ({dbname: "bounty_hunter", host: "localhost"})
    sql = "SELECT * FROM bounty_properties WHERE name = #{name};"
    bounty_hunters = db.exec(sql)
    db.close()
    return BountyHunter.new(bounty_hunters)
  end



end