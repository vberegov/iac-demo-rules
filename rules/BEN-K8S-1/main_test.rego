package rules

import data.lib
import data.lib.testing

test_BEN_K8S_1 {
	# array containing test cases where the rule is allowed
	allowed_test_cases := [{
		"want_msgs": [],
		"fixture": "allowed.yaml",
	}]

	# array containing cases where the rule is denied
	denied_test_cases := [{
		"want_msgs": ["input.spec.template.spec.containers[nginx:latest]"],
		"fixture": "denied.yaml",
	}]

	test_cases := array.concat(allowed_test_cases, denied_test_cases)
	testing.evaluate_test_cases("BEN-K8S-1", "./rules/BEN-K8S-1/fixtures", test_cases)
}
