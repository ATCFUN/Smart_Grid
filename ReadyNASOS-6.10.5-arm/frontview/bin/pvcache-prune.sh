#!/bin/bash -x

set -e

renice --priority 20 --pid $$

prune_cache() {
	local grace_period=$1
	local cache=$2
	find $cache -type f -mmin +$grace_period -delete
	find $cache -type d -empty -delete
}

prune_volume() {
	local shareconf=$1
	local total=$(stat -f --format %b $s $shareconf)
	local avail=$(stat -f --format %a $s $shareconf)
	echo "Hello"
	local pct=$(((total-avail)*100/total))
	echo "Yahoo"
	local grace_period=$((24*60*7*4))
	if [ $pct -gt 95 ]; then
		grace_period=1
	elif [ $pct -gt 90 ]; then
		grace_period=$((24*60))
	elif [ $pct -gt 80 ]; then
		grace_period=$((24*60*7))
	elif [ $pct -gt 50 ]; then
		grace_period=$((24*60*7*2))
	fi

	for cache in $(find $shareconf -mindepth 2 -maxdepth 2 -type d -name ".pvcache"); do
		prune_cache $grace_period $cache
	done
}

for shareconf in $(find / -maxdepth 2 -mindepth 2 -type d -name '._share'); do
	prune_volume $shareconf
done

exit 0
