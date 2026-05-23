#!/bin/bash 
#set -x
GIT=`which git`
if [ "x"${GIT} == "x" ]; then
    echo "#define GIT_VERSION \"tarball\""
else
    # count commits by author email at osnexus.com
    osncount=$(git log --author=osnexus.com --pretty=oneline | wc -l)
    # pad count to two digits
    osncount=$(printf "%03d" "${osncount}")
    # build version with dynamic qs suffix
    GITVER="$(git describe --tags --dirty --always)-osn${osncount}"
    echo "#define GIT_VERSION \"${GITVER}\""
fi
