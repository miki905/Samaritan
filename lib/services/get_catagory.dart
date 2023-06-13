class CategoryService {
  static String catagory_query = """query getCatagory(\$id:uuid!,\$cat:String!){
  medicine(where: {medicine_user: {id: {_eq:\$id}}, catagory: {_eq:\$cat}}) {
      id
      description
      expire_date
      generic_name
      medicine_name
      manufacturer
      brand_name
      amount_in_stock
      catagory
      price
      sku
      weight
      }
    }""";

  static String location_query = """query GetPharmacyLocation(\$name:String!){
   users(where: {users_medicines: {medicine_name: {_eq: \$name}}}) {
      id
      name
      pharmacy_name
        users_locations {
          id
          latitude
          longitude
          address
        }
      }
    }""";
  static String price_query = """query GetPrice(\$id:uuid!,\$medName:String!){
   medicine(where: {medicine_user: {id: {_eq: \$id}}, medicine_name: {_eq: \$medName}}) {
        id
        medicine_name
        price
      }
    }""";
}
