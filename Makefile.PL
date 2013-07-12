
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Publish documents in new format",
  "AUTHOR" => "Renee Baecker <module\@renee-baecker.de>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "EPublisher",
  "EXE_FILES" => [],
  "LICENSE" => "artistic_2",
  "NAME" => "EPublisher",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Data::Dumper" => 0,
    "File::Basename" => 0,
    "File::Find::Rule" => 0,
    "File::Glob" => 0,
    "File::Spec" => 0,
    "File::Temp" => 0,
    "IO::String" => 0,
    "List::Util" => 0,
    "Module::Info" => "0.32",
    "PPI" => "1.213",
    "Pod::Text" => "3.08",
    "YAML::Tiny" => 0
  },
  "TEST_REQUIRES" => {},
  "VERSION" => 1,
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



