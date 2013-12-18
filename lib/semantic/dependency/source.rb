require 'semantic/dependency'

module Semantic
  module Dependency
    class Source
      def create_release(name, version, dependencies = {})
        version = Version.parse(version) if version.is_a? String
        dependencies = dependencies.inject({}) do |hash, (key, value)|
          hash[key] = VersionRange.parse(value || '>= 0')
          hash[key] ||= VersionRange::EMPTY_RANGE
          hash
        end
        ModuleRelease.new(self, name, version, dependencies)
      end

      private
      ROOT_CAUSE = Source.new()
    end
  end
end
