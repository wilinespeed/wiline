#--
# Author:: Adam Jacob (<adam@chef.io>)
# Author:: Christopher Walters (<cw@chef.io>)
# Copyright:: Copyright 2008-2016, 2009-2015 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "chef/exceptions"
require "chef/dsl/resources"
require "chef/dsl/definitions"
require "chef/dsl/data_query"
require "chef/dsl/platform_introspection"
require "chef/dsl/include_recipe"
require "chef/dsl/registry_helper"
require "chef/dsl/reboot_pending"
require "chef/dsl/audit"
require "chef/dsl/powershell"
require "chef/dsl/core"
require "chef/dsl/method_missing"
require "chef/mixin/lazy_module_include"

class Chef
  module DSL
    # This is the "Recipe DSL" which is all the sugar, plus all the resources and definitions
    # which are mixed into user LWRPs/Resources/Providers.
    #
    # - If you are writing cookbooks:  you have come to the right place, please inject things
    #   into here if you want to make them available to all recipe and non-core provider code.
    #
    # - If you are writing core chef:  you have likely come to the wrong place, please consider
    #   dropping your DSL modules into Chef::DSL::Core instead so that we can use them in core
    #   providers (unless they are *only* intended for recipe code).
    #
    module Recipe
      include Chef::DSL::Core
      include Chef::DSL::DataQuery
      include Chef::DSL::PlatformIntrospection
      include Chef::DSL::IncludeRecipe
      include Chef::DSL::RegistryHelper
      include Chef::DSL::RebootPending
      include Chef::DSL::Audit
      include Chef::DSL::Powershell
      include Chef::DSL::Resources
      include Chef::DSL::Definitions
      # method_missing will disappear in Chef 13
      include Chef::DSL::MethodMissing
      extend Chef::Mixin::LazyModuleInclude

      def resource_class_for(snake_case_name)
        Chef::Resource.resource_for_node(snake_case_name, run_context.node)
      end

      def have_resource_class_for?(snake_case_name)
        not resource_class_for(snake_case_name).nil?
      rescue NameError
        false
      end

      def exec(args)
        raise Chef::Exceptions::ResourceNotFound, "exec was called, but you probably meant to use an execute resource.  If not, please call Kernel#exec explicitly.  The exec block called was \"#{args}\""
      end

      # @deprecated Use Chef::DSL::Recipe instead, will be removed in Chef 13
      module FullDSL
        include Chef::DSL::Recipe
        extend Chef::Mixin::LazyModuleInclude
      end
    end
  end
end

# Avoid circular references for things that are only used in instance methods
require "chef/resource"

# **DEPRECATED**
# This used to be part of chef/mixin/recipe_definition_dsl_core. Load the file to activate the deprecation code.
require "chef/mixin/recipe_definition_dsl_core"
