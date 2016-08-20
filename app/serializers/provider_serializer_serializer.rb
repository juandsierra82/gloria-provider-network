class ProviderSerializerSerializer < ActiveModel::Serializer
  attributes(Provider.attribute_names.map(&:to_sym))
end
