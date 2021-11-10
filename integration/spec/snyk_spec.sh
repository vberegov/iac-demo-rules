Describe 'snyk_cli.sh'
  Include lib/snyk_results.sh
  It 'BEN-K8S-1 - included in thte output'
    When call parse
    The output should include 'input.spec.template.spec.containers[nginx:latest]'
  End
  It 'BEN-K8S-2 - included in thte output'
    When call parse
    The output should include 'input.spec.template.spec.containers[nginx:latest]'
  End
End