module DocusignRest
  class TabContainer < Model
    hash_attr :signHereTabs, :textTabs

    private
    def initialize(hash)
      hash.keys.each do |key|
        case key
          when 'textTabs'
            self.textTabs = hash['textTabs'].map { |tab| DocusignRest::TextTab.new tab } unless hash['textTabs'].nil?
          when 'signHereTabs'
            self.signHereTabs = hash['signHereTabs'].map { |tab| DocusignRest::SignHereTab.new tab } unless hash['signHereTabs'].nil?
          else
            attribute_hash[key] = hash[key]
        end
      end
    end
  end
end