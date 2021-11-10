test:
	snyk-iac-rules test

build:
	snyk-iac-rules build

int:
	snyk iac test --rules=bundle.tar.gz --org=ben.laplanche --json-file-output=results.json &>/dev/null || true && cd integration && shellspec