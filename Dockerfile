FROM scratch

ARG ROOTFS
ADD $ROOTFS /

CMD ["/bin/bash"]
