class GraphQlQuery {
  static const String productQuery = '''
    {
  products(first: 45, channel: "default-channel") {
    edges {
      node {
        id
        name
        description
        seoTitle
        pricing{
          onSale
          discount{
           
            net{
              currency
              amount
            }
           
          }
          
        }
        media{
          id
          url
        }
      }
    }
  }
}
''';
}
