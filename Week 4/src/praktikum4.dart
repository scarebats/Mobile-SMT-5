void main() {
  // langkah 1
  print("\nLangkah 1");
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  print("list: $list");
  print("list2: $list2");
  print("list2.length: ${list2.length}");

  // langkah 3
  print("\nLangkah 3");
  List<int?> list1 = [1, 2, null]; 
  print("list1: $list1");
  var list3 = [0, ...list1]; 
  print("list3.length: ${list3.length}");

  var nim = ['2', '3', '4', '1', '7', '2', '0', '0', '4', '7'];
  var listWithNIM = [...list, ...nim];
  print("nim: $nim");
  print("listWithNIM: $listWithNIM");

  // langkah 4
  print("\nLangkah 4");
  List<String> createNav(bool promoActive) {
    return ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  }

  print("Test promoActive = true:");
  var navTrue = createNav(true);
  print("nav: $navTrue");

  print("Test promoActive = false:");
  var navFalse = createNav(false);
  print("nav: $navFalse");

  // langkah 5
  print("\nLangkah 5");

  String login = 'Manager';
  var navManager = [
    'Home',
    'Furniture',
    'Plants',
    if (login case 'Manager') 'Inventory',
  ];
  print("nav (login='Manager'): $navManager");

  login = 'User';
  var navUser = [
    'Home',
    'Furniture',
    'Plants',
    if (login case 'Manager') 'Inventory',
  ];
  print("nav (login='User'): $navUser");

  login = 'Admin';
  var navAdmin = [
    'Home',
    'Furniture',
    'Plants',
    if (login case 'Manager') 'Inventory',
  ];
  print("nav (login='Admin'): $navAdmin");

  // langkah 6
  print("\nLangkah 6");
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print("listOfInts: $listOfInts");
  print("listOfStrings: $listOfStrings");
}