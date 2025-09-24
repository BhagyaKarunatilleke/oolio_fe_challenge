import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/storage/sync_queue_manager.dart';
import '../../../../core/services/connectivity_service.dart';
import '../../data/models/sync_queue_item.dart';

part 'sync_state.dart';

@injectable
class SyncCubit extends Cubit<SyncState> {
  final SyncQueueManager _syncManager;
  final ConnectivityService _connectivityService;
  StreamSubscription<SyncQueueEvent>? _eventSubscription;
  StreamSubscription<bool>? _connectivitySubscription;

  SyncCubit(this._syncManager, this._connectivityService)
    : super(const SyncInitial()) {
    _initialize();
  }

  void _initialize() {
    _eventSubscription = _syncManager.eventController.stream.listen(
      _handleSyncEvent,
      onError: (error) => emit(SyncError(error.toString())),
    );

    // Listen for connectivity changes
    _connectivitySubscription = _connectivityService.connectivityStream.listen(
      (isConnected) {
        emit(SyncOnlineStatusChanged(isConnected));
      },
      onError: (error) {
        print('Connectivity stream error: $error');
      },
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
    // Real connectivity status is managed by ConnectivityService
    // This method is kept for compatibility but doesn't actually change connectivity
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

  @override
  Future<void> close() {
    _eventSubscription?.cancel();
    _connectivitySubscription?.cancel();
    return super.close();
  }

  Future<void> clearQueue() async {
    try {
      await _syncManager.clearQueue();
      emit(const SyncQueueCleared());
    } catch (e) {
      emit(SyncError(e.toString()));
    }
  }
}
