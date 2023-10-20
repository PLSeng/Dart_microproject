void main() async {
  /* write your code here */
  noWaiting('caffe americano');
  noWaiting('latte');
  await order('cappuccino');
  await order('espresso');
  noWaiting('macchiato');
}

Future<void> order(String order, {int time = 3}) async {
  await Future.delayed(Duration(seconds: time));
  print('order: $order is ready');
}

void noWaiting(String order) {
  print('no waiting order: $order is ready');
}