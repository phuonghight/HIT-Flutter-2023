// ignore_for_file: file_names

String formatPriceToString(double price) =>
    '${price.toInt().toString().replaceAll(RegExp(r'\D'), '').replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (Match m) => ',')}₫';
