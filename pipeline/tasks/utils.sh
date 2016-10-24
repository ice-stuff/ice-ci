mount_graph() {
  mkdir /tmp/graph
  mount -t tmpfs none /tmp/graph
}

mount_cgroups() {
	# see https://github.com/docker/docker/issues/8791
	if grep -v '^#' /etc/fstab | grep -q cgroup \
			|| [ ! -e /proc/cgroups ] \
			|| [ ! -d /sys/fs/cgroup ]; then
		return
	fi
	if ! mountpoint -q /sys/fs/cgroup; then
		mount -t tmpfs -o uid=0,gid=0,mode=0755 cgroup /sys/fs/cgroup
	fi
	(
		cd /sys/fs/cgroup
		for sys in $(awk '!/^#/ { if ($4 == 1) print $1 }' /proc/cgroups); do
			mkdir -p $sys
			if ! mountpoint -q $sys; then
				if ! mount -n -t cgroup -o $sys cgroup $sys; then
					rmdir $sys || true
				fi
			fi
		done
	)
}

start_local_docker() {
	mount_graph
	mount_cgroups
	dockerd -g /tmp/graph > /tmp/docker.log 2>&1 &
}

ping_local_docker() {
	secs=0
	while [ $secs -lt 10 ]; do
		if docker info > /dev/null; then
			return
		fi

		sleep 5
		secs=$(($secs+5))
	done
}
