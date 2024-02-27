enum ResponseAPI { failed, getFailed }

enum JenisMusic {
  discovery(text: 'discovery'),
  topHits(text: 'tophits');

  const JenisMusic({
    required this.text,
  });
  final String text;
}

enum Status {
  noconnection(text: 'noconnection'),
  empty(text: 'kosong'),
  error(text: 'error');

  const Status({
    required this.text,
  });
  final String text;
}
