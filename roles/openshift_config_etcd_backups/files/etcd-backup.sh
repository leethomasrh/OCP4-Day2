#!/bin/bash

DATE=$(date +%Y%m%dT%H%M%S)

/usr/local/bin/etcd-snapshot-backup-disconnected.sh /assets/backup

if [ $? -eq 0 ]; then
    mkdir /etcd-backup/{{ openshift_cluster_name }}/${DATE}
    cp -r /assets/backup/*  /etcd-backup/{{ openshift_cluster_name }}/${DATE}/
    echo 'Deleting backups older than {{ etcd_backup_daysToKeepBackups }} days'
    find /etcd-backup/{{ openshift_cluster_name }} -type d -mtime +{{ etcd_backup_daysToKeepBackups }} -execdir rm -rf -- '{}' +
    echo 'Copied backup files to PVC mount point.'
    exit 0
fi

echo "Backup attempts failed. Please FIX !!!"
exit 1
