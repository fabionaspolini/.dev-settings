alias btrfs-cleanup="sudo systemctl start snapper-cleanup.service"
alias btrfs-cleanup-status="systemctl status snapper-cleanup.service"
alias btrfs-cleanup-logs="journalctl -u snapper-cleanup.service"
