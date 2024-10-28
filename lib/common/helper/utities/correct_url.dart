String correctUrl(String url) {
  // Loại bỏ dấu "/" thừa nếu có
  if (url.contains("https://")) {
    url = url.replaceFirst("https://", "https://");
  }
  return url;
}

