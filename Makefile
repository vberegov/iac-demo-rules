test:
	snyk-iac-rules test

build:
	snyk-iac-rules build

integration:
	- snyk iac test --rules=bundle.tar.gz --org=ben.laplanche