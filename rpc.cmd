
bdev_malloc_create -b malloc0 1024 512
nvmf_create_subsystem nqn.2025-01.io.spdk:cnode1 -a
nvmf_subsystem_add_ns nqn.2025-01.io.spdk:cnode1 malloc0
nvmf_create_transport -t tcp
nvmf_subsystem_add_listener nqn.2025-01.io.spdk:cnode1 -t tcp -a 127.0.0.1 -s 4420
