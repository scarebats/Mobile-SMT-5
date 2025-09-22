void main() {
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings',
  };

  var nobleGases = {2: 'helium', 10: 'neon', 18: 'argon'};

  print('gifts: $gifts');
  print('nobleGases: $nobleGases');

  var mhs1 = Map<String, String>();
  mhs1['first'] = 'partridge';
  mhs1['second'] = 'turtledoves';
  mhs1['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  mhs2[2] = 'helium';
  mhs2[10] = 'neon';
  mhs2[18] = 'argon';

  gifts['nama'] = 'Ahmad Naufal Ilham';
  gifts['nim'] = '2341720047';

  nobleGases[1] = 'Ahmad Naufal Ilham';
  nobleGases[30] = '2341720047';

  mhs1['nama'] = 'Ahmad Naufal Ilham';
  mhs1['nim'] = '2341720047';

  mhs2[1] = 'Ahmad Naufal Ilham';
  mhs2[30] = '2341720047';

  print('\nHASIL');
  print('gifts: $gifts');
  print('nobleGases: $nobleGases');
  print('mhs1: $mhs1');
  print('mhs2: $mhs2');
}