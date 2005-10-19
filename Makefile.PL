use 5.008005;
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME              => 'Algorithm::Diff3',
    VERSION_FROM      => 'lib/Algorithm/Diff3.pm',
    PREREQ_PM         => {},
    ($] >= 5.005 ?
      (ABSTRACT_FROM  => 'lib/Algorithm/Diff3.pm',
       AUTHOR         => 'MIZUTANI Tociyuki <tociyuki@gmail.com>') : ()),
);
