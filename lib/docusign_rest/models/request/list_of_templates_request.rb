module DocusignRest
  class ListOfTemplatesRequest < Request
  	hash_attr :order

  	def initialize(args = {})
  		args[:order] ||= :asc
  		super args
  	end

  	def uri
      "/templates?order=#{order}"
    end
  end
end