abstract class ClientHomeEvent {}

class ChangeDrawerPage extends ClientHomeEvent {
  final int pageIndex;
  ChangeDrawerPage({required this.pageIndex});
}
