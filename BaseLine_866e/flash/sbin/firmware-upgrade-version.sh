#!/bin/sh

archive_path=/media/ram/firmware
archive_path2=/var/volatile/firmware
archive_pattern=BaseLine_*.tar.gz
tmp_dir=var/volatile/tmp/baseLine

# check for default firmware archive file
set +e # if file not found ls generates an error that we want to ignore
archive="$(ls $archive_path/$archive_pattern 2>/dev/null)"
set -e
if [ -z "$archive" ]; then
    set +e
    archive="$(ls $archive_path2/$archive_pattern 2>/dev/null)"
    set -e
    if [ -z "$archive" ]; then
        echo "ERROR firmware archive '$archive_path/$archive_pattern' not found"
        exit 1
    fi
fi
if [ $(echo "$archive" | wc -l) -ne 1 ]; then
    echo "ERROR multiple firmware archives found: $(echo $archive|tr '\n' ' ')"
    exit 1
fi
set +e

# Check the data integrity of the file
gzip -t $archive 2>/dev/null
if [ $? != 0 ]; then
    # The data integrity is not ok, it should be a crypted Baseline release
    if [ -x /usr/sbin/xzunzip ]; then
        fw_version="$(/usr/sbin/xzunzip -m -i $archive | grep -i fwVersion 2>/dev/null)"
        echo $fw_version | cut -d':' -f2 | rev | cut -d'_' -f2- | rev
    else
        #get the version from the tar.gz name
        echo $archive | awk 'match($0, /[0-9]{2}.[0-9]{2}.[0-9]{2}/) {print substr($0, RSTART, RLENGTH)}'
    fi
else
    versions_file="$(tar ztvf $archive | grep $tmp_dir/versions.txt 2>/dev/null)"
    if [ "$versions_file" != "" ]; then
        tar zxOf $archive $tmp_dir/versions.txt| head -n1 |cut -d' ' -f3
    else
        #At this point, we are installing a release without CS brick
        echo $archive | awk 'match($0, /[0-9]{2}.[0-9]{2}.[0-9]{2}/) {print substr($0, RSTART, RLENGTH)}'
    fi
fi
#ls $archive_path/$archive_pattern | cut -d_ -f2 | awk -F '.tar' '{print $1}' #get the version from the tar.gz name