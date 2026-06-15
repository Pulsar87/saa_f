abstract class DrawerEvent {}
class DrawerChangeDrawerBodyEvent extends DrawerEvent {
  final int drawerId;

  DrawerChangeDrawerBodyEvent({required this.drawerId});
}
class DrawerUpdateEvent extends DrawerEvent {}
