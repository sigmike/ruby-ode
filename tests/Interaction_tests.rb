#!/usr/bin/ruby

require "walkit/cli_script"
require "ode"

class Interaction_test < Walkit::Testclass

	def test_00_world_scope
		body = nil

		# Test to be sure the world going out of scope doesn't hork our body
		# object, which is still in scope.
		vet {
			body = ODE::World.new.createBody

			100.times { ODE::World.new ; GC.start }
			assert_no_exception { body.position }
		}
	end

	def test_01_simple
		vet {
		}
		
	end

end

if $0 == __FILE__
    Walkit::Cli_script.new.select([Interaction_test], $*.shift)
end
