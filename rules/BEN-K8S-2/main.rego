package rules

deny[msg] {
	resource := input.spec.template.spec.containers[_]
	tag := split(resource.image, ":")
	tag[_] = "latest"

	msg := {
		# Mandatory fields
		"publicId": "BEN-K8S-2",
		"title": "Container images must specific an exact version",
		"severity": "critical",
		"msg": sprintf("input.spec.template.spec.containers[%s]", [resource.image]),
		# Optional fields
		"issue": "You are specifying the `latest` tag for the image",
		"impact": "The image related to the `latest` tag may change, resulting in un-expected consequences",
		"remediation": "Update your image location to give a specific tag",
		"references": [],
	}
}
