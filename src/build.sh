#!/usr/bin/env bash

set -e

apt update && apt install libpar-packer-perl --yes

wget https://github.com/daveewart/colordiff/raw/58244c5faaf194f1e5f91babd04f07c692d4d0aa/colordiff.pl
wget https://github.com/daveewart/colordiff/raw/58244c5faaf194f1e5f91babd04f07c692d4d0aa/colordiffrc

mkdir etc
mv colordiffrc etc/
sed -i -e '78i my $bindir = File::Basename::dirname($0);' -e '27i use File::Basename ();' -e "s:'/etc':\"\${bindir}/etc\":g" colordiff.pl
pp colordiff.pl -o colordiff
rm colordiff.pl
tar czf colordiff-1.0.20.tar.gz colordiff etc
