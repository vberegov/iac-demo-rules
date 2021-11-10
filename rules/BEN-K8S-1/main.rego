package rules

deny[msg] {
	resource := input.spec.template.spec.containers[_]
	not startswith(resource.image, "https://registry.hub.docker.com")

	msg := {
		# Mandatory fields
		"publicId": "BEN-K8S-1",
		"title": "Container images must be pulled from an approved registry",
		"severity": "critical",
		"msg": sprintf("input.spec.template.spec.containers[%s]", [resource.image]),
		# Optional fields
		"issue": "You are pulling images from an un-approved location which means they have not been vetted for use",
		"impact": "You may use an un-approved container image containing security vulnerabilities",
		"remediation": "Update your image location to use https://registry.hub.docker.com/library/",
		"references": [],
	}
}
