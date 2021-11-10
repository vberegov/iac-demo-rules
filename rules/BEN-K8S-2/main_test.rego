package rules

import data.lib
import data.lib.testing

test_BEN_K8S_2 {
	# array containing test cases where the rule is allowed
	allowed_test_cases := [{
		"want_msgs": [],
		"fixture": "allowed.yaml",
	}]

	# array containing cases where the rule is denied
	denied_test_cases := [{
		"want_msgs": ["input.spec.template.spec.containers[nginx:latest]"], # verifies that the correct msg is returned by the denied rule
		"fixture": "denied.yaml",
	}]

	test_cases := array.concat(allowed_test_cases, denied_test_cases)
	testing.evaluate_test_cases("BEN-K8S-2", "./rules/BEN-K8S-2/fixtures", test_cases)
}
