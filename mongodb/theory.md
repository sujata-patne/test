<h2>MongoDB interview question</h2>

<details>
<summary>
<b>Can we perform joins in mongodb ?</b>
</summary>
Yes, you can perform joins in MongoDB using the `$lookup` operator, which is essentially identical to a left outer join. Here's the syntax:

```js
db.inventory.insertMany([
   { prodId: 100, price: 20, quantity: 125 },
   { prodId: 101, price: 10, quantity: 234 },
   { prodId: 102, price: 15, quantity: 432 },
   { prodId: 103, price: 17, quantity: 320 }
])

db.orders.insertMany([
   { orderId: 201, custid: 301, prodId: 100, numPurchased: 20 },
   { orderId: 202, custid: 302, prodId: 101, numPurchased: 10 },
   { orderId: 203, custid: 303, prodId: 102, numPurchased: 5 },
   { orderId: 204, custid: 303, prodId: 103, numPurchased: 15 },
   { orderId: 205, custid: 303, prodId: 103, numPurchased: 20 },
   { orderId: 206, custid: 302, prodId: 102, numPurchased: 1 },
   { orderId: 207, custid: 302, prodId: 101, numPurchased: 5 },
   { orderId: 208, custid: 301, prodId: 100, numPurchased: 10 },
   { orderId: 209, custid: 303, prodId: 103, numPurchased: 30 }
])
```

```js
{
  $lookup:
    {
      from: <collection to join>,
      localField: <field from the input documents>,
      foreignField: <field from the documents of the "from" collection>,
      as: <output array field>
    }
}
```

This operator is used within an aggregation pipeline. The `$lookup` stage adds a new array field to the input documents. The new array field contains the matching documents from a join collection.

Here's an example of how you can use `$lookup` to join two collections, `orders` and `inventory`, on the `prodId` field:

```js
db.createView(
  "sales",
  "orders",
  [
    {
      $lookup: {
        from: "inventory",
        localField: "prodId",
        foreignField: "prodId",
        as: "inventoryDocs"
      }
    },
    {
      $project: {
        _id: 0,
        prodId: 1,
        orderId: 1,
        numPurchased: 1,
        price: "$inventoryDocs.price"
      }
    },
    {
      $unwind: "$price"
    }
  ]
)
```

In this example, the `$lookup` stage uses the `prodId` field in the `orders` collection to "join" documents in the `inventory` collection that have matching `prodId` fields. The matching documents are added as an array in the `inventoryDocs` field.

Please note that MongoDB is not a relational database, and the developers recommend specific use cases for `$lookup`. But at least as of MongoDB 3.2, performing a join is now possible.
</details>
