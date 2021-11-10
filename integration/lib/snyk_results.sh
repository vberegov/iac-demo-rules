parse() {
  jq '.[].infrastructureAsCodeIssues[].msg' ../results.json
}