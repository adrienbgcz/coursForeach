const express = require("express");
const app = express();
const PORT = 9000;

app.use(express.json());

const books = [
  {
    id: 1,
    title: "Le seigneur des anneaux",
    author: "J.R.R Tolkien",
    year: " 1978"
  },
  {
    id: 2,
    title: "Le javaScript pour les nuls",
    author: "Aurore",
    year: " 2021"
  }
];

app.get("/", (req, res) => {
  res.json({
    title: "Hello World"
  });
});

app.get("/books", (req, res) => {
  // DB : SELECT * FROM BOOK
  res.json(books);
});

// app.get("/books", (req, res) => {
//   console.log(req.query);
//   const book = books.filter((book) => book.id == req.query.id);
//   res.json(book);
// });

app.get("/books/:id", (req, res) => {
  //   console.log(req.query, req.params);
  const book = books.filter((book) => book.id == req.params.id);
  res.json(book);
});

app.post("/books", (req, res) => {
  //   console.log(req.body.newBook);
  books.push(req.body.newBook);
  res.json(books);
});

app.put("/books/:id", (req, res) => {
  // const updatedBook = req.body.updatedBook;
  const { id } = req.params;
  const { updatedBook } = req.body;
  res.send("mise à jour d'un livre");
  // DB : UPDATE books SET title = updatedBook.title WHERE id = id

  res.send(books);
});

app.delete("/books/:id", (req, res) => {
  const { id } = req.params;
  res.send(`supression du livre avec l'id ${id}`);
  // DB : DELETE FROM book WHERE id = id
  //   res.send(books);
});

app.get("/movies", (req, res) => {
  const movies = [
    {
      id: 1,
      title: "La communauté de l'anneau",
      director: "P.Jackson",
      year: "2010"
    },
    {
      id: 2,
      title: "Les deux tours",
      director: "P.Jackson",
      year: "2013"
    },
    {
      id: 3,
      title: "Le retour du roi",
      director: "P.Jackson",
      year: "2067"
    }
  ];
  res.json(movies);
});

app.listen(PORT, () => console.log(`app runs on port ${PORT}`));
