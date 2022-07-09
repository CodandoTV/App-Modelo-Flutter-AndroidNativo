abstract class UserAnalytics {
  void trackActionButton();
}

class UserAnalyticsImpl implements UserAnalytics {
  @override
  void trackActionButton() {
    print(">>>>qualquer log$_OPEN_DETAIL_EVENT");
  }

  static const String _OPEN_DETAIL_EVENT = "open_detail_event";
}
