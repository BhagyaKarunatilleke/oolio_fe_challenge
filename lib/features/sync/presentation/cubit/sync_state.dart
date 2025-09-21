part of 'sync_cubit.dart';

abstract class SyncState extends Equatable {
  const SyncState();

  @override
  List<Object?> get props => [];
}

class SyncInitial extends SyncState {
  const SyncInitial();
}

class SyncProcessing extends SyncState {
  const SyncProcessing();
}

class SyncCompleted extends SyncState {
  const SyncCompleted();
}

class SyncError extends SyncState {
  final String message;

  const SyncError(this.message);

  @override
  List<Object?> get props => [message];
}

class SyncItemQueued extends SyncState {
  final SyncQueueItem item;

  const SyncItemQueued(this.item);

  @override
  List<Object?> get props => [item];
}

class SyncItemProcessing extends SyncState {
  final SyncQueueItem item;

  const SyncItemProcessing(this.item);

  @override
  List<Object?> get props => [item];
}

class SyncItemCompleted extends SyncState {
  final SyncQueueItem item;

  const SyncItemCompleted(this.item);

  @override
  List<Object?> get props => [item];
}

class SyncItemFailed extends SyncState {
  final SyncQueueItem item;
  final String error;

  const SyncItemFailed(this.item, this.error);

  @override
  List<Object?> get props => [item, error];
}

class SyncItemRemoved extends SyncState {
  final SyncQueueItem item;

  const SyncItemRemoved(this.item);

  @override
  List<Object?> get props => [item];
}

class SyncQueueCleared extends SyncState {
  const SyncQueueCleared();
}

class SyncOnlineStatusChanged extends SyncState {
  final bool isOnline;

  const SyncOnlineStatusChanged(this.isOnline);

  @override
  List<Object?> get props => [isOnline];
}

class SyncStatsLoaded extends SyncState {
  final SyncQueueStats stats;

  const SyncStatsLoaded(this.stats);

  @override
  List<Object?> get props => [stats];
}
