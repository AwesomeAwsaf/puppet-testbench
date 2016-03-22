## install Git
class git {

    package { 'git':
      ensure   => 'installed',
      provider => 'chocolatey',
  }
}
