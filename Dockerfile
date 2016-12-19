FROM index.alauda.cn/alexander/ceph-base:10.2.5

# Add bootstrap script
ADD entrypoint.sh /entrypoint.sh

# Add volumes for ceph config and monitor data
VOLUME ["/etc/ceph","/var/lib/ceph"]

# Expose the ceph monitor port (6789, by default)
EXPOSE 6789

RUN chmod +x /entrypoint.sh

RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Execute monitor as the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
