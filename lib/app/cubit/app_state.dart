part of 'app_cubit.dart';

enum AppPages { listPage, orangePage, redPage }

enum MenuStatus {
  isOpen,
  isClose,
}

enum AppMenu {
  open(status: MenuStatus.isOpen),
  close(status: MenuStatus.isClose);

  const AppMenu({required this.status});
  final MenuStatus status;

  bool get isOpen => status == MenuStatus.isOpen;
}

class AppState extends Equatable {
  const AppState._({
    required this.menuApp,
    required this.appPages,
  });

  const AppState.initial()
      : this._(
          menuApp: AppMenu.close,
          appPages: AppPages.listPage,
        );

  final AppMenu menuApp;
  final AppPages appPages;

  @override
  List<Object> get props => [menuApp, appPages];

  AppState copyWith({
    AppMenu? menuApp,
    AppPages? appPages,
  }) {
    return AppState._(
      menuApp: menuApp ?? this.menuApp,
      appPages: appPages ?? this.appPages,
    );
  }

  int indexPage(AppPages page) {
    switch (page) {
      case AppPages.listPage:
        return 0;
      case AppPages.orangePage:
        return 1;
      case AppPages.redPage:
        return 2;
      default:
        return 0;
    }
  }
}
