import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/storage/sync_queue_manager.dart';
import '../../data/models/sync_queue_item.dart';

part 'sync_state.dart';

@injectable
class SyncCubit extends Cubit<SyncState> {
  final SyncQueueManager _syncManager;
  StreamSubscription<SyncQueueEvent>? _eventSubscription;

  SyncCubit(this._syncManager) : super(const SyncInitial()) {
    _initialize();
  }

  void _initialize() {
    _eventSubscription = _syncManager.eventController.stream.listen(
      _handleSyncEvent,
      onError: (error) => emit(SyncError(error.toString())),
    );
  }

  void _handleSyncEvent(SyncQueueEvent event) {
    if (event is SyncQueueItemQueued) {
      emit(SyncItemQueued(event.item));
    } else if (event is SyncQueueItemProcessing) {
      emit(SyncItemProcessing(event.item));
    } else if (event is SyncQueueItemCompleted) {
      emit(SyncItemCompleted(event.item));
    } else if (event is SyncQueueItemFailed) {
      emit(SyncItemFailed(event.item, event.error));
    } else if (event is SyncQueueItemRemoved) {
      emit(SyncItemRemoved(event.item));
    } else if (event is SyncQueueCleared) {
      emit(const SyncQueueCleared());
    }
  }

  Future<void> triggerSync() async {
    emit(const SyncProcessing());
    try {
      await _syncManager.triggerSync();
      emit(const SyncCompleted());
    } catch (e) {
      emit(SyncError(e.toString()));
    }
  }

  Future<void> setOnlineStatus(bool isOnline) async {
    _syncManager.setOnlineStatus(isOnline);
    emit(SyncOnlineStatusChanged(isOnline));
  }

  Future<void> getQueueStats() async {
    try {
      final stats = await _syncManager.getQueueStats();
      emit(SyncStatsLoaded(stats));
    } catch (e) {
      emit(SyncError(e.toString()));
    }
  }

  Future<void> clearQueue() async {
    try {
      await _syncManager.clearQueue();
      emit(const SyncQueueCleared());
    } catch (e) {
      emit(SyncError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _eventSubscription?.cancel();
    return super.close();
  }
}
