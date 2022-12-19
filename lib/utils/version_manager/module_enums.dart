enum Module {
  login,
  home,
  products,
  profile,
  attendance,
  attendance_reminder,
  carts,
  notFound
}

Module stringToModuleName(String name) {
  return Module.values.firstWhere(
          (e) => e.name == name,
      orElse: () => Module.notFound);
}