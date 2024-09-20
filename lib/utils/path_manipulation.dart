String getFileNameFromAbsolutePath(String fullPath) {
  return fullPath.split('/')[fullPath.split('/').length - 1];
}
