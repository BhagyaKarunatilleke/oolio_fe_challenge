enum SyncStatus {
  pending,    // Queued for sync
  syncing,    // Currently syncing
  synced,     // Successfully synced
  failed,     // Sync failed
  conflicted  // Has conflicts
}
