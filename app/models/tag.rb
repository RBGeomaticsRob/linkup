class Tag

  include DataMapper::Resource

  has n, :links, through: Resource

  property :id, Serial
  property :text, String
  property :description, String
  property :extra_item, String
  property :another, String

end
