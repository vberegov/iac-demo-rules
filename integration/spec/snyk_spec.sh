Describe 'snyk_cli.sh'
  Include lib/snyk_results.sh
  It 'includes our custom rules output'
    When call parse ShellSpec
    The output should equal 'Hello ShellSpec!'
  End
End