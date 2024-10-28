String cleanUrl(String url) {
  // Xóa các ký tự không hợp lệ khỏi URL
  return url.replaceAll("(", "").replaceAll(")", "");
}
