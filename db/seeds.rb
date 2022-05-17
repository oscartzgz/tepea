# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

STATES = [
  { "clave": "AGS", "nombre": "AGUASCALIENTES" },
  { "clave": "BC",  "nombre": "BAJA CALIFORNIA" },
  { "clave": "BCS", "nombre": "BAJA CALIFORNIA SUR" },
  { "clave": "CHI", "nombre": "CHIHUAHUA" },
  { "clave": "CHS", "nombre": "CHIAPAS" },
  { "clave": "CMP", "nombre": "CAMPECHE" },
  { "clave": "CMX", "nombre": "CIUDAD DE MEXICO" },
  { "clave": "COA", "nombre": "COAHUILA" },
  { "clave": "COL", "nombre": "COLIMA" },
  { "clave": "DGO", "nombre": "DURANGO" },
  { "clave": "GRO", "nombre": "GUERRERO" },
  { "clave": "GTO", "nombre": "GUANAJUATO" },
  { "clave": "HGO", "nombre": "HIDALGO" },
  { "clave": "JAL", "nombre": "JALISCO" },
  { "clave": "MCH", "nombre": "MICHOACAN" },
  { "clave": "MEX", "nombre": "ESTADO DE MEXICO" },
  { "clave": "MOR", "nombre": "MORELOS" },
  { "clave": "NAY", "nombre": "NAYARIT" },
  { "clave": "NL",  "nombre": "NUEVO LEON" },
  { "clave": "OAX", "nombre": "OAXACA" },
  { "clave": "PUE", "nombre": "PUEBLA" },
  { "clave": "QR",  "nombre": "QUINTANA ROO" },
  { "clave": "QRO", "nombre": "QUERETARO" },
  { "clave": "SIN", "nombre": "SINALOA" },
  { "clave": "SLP", "nombre": "SAN LUIS POTOSI" },
  { "clave": "SON", "nombre": "SONORA" },
  { "clave": "TAB", "nombre": "TABASCO" },
  { "clave": "TLX", "nombre": "TLAXCALA" },
  { "clave": "TMS", "nombre": "TAMAULIPAS" },
  { "clave": "VER", "nombre": "VERACRUZ" },
  { "clave": "YUC", "nombre": "YUCATAN" },
  { "clave": "ZAC", "nombre": "ZACATECAS" } 
]

STATES.each { |state| State.where(code: state[:clave], name: state[:nombre]).first_or_create }

Municipality.first_or_create(name: "Tepeapulco") do |municipality|
  state = State.find_by_code("HGO")

  municipality.state = state
  municipality.latitude = 19.7857024
  municipality.longitude = -98.5576381
end