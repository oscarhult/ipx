"use strict";

const express = require("express");
const app = express();
const port = process.env.port || 3000;

const { createIPX, createIPXMiddleware } = require("ipx");
const ipx = createIPX({ dir: "image" });

app.use(
  "/",
  (req, res, next) => {
    console.log(`${req.method} ${req.originalUrl}`);
    next();
  },
  createIPXMiddleware(ipx)
);

app.listen(port, () => {
  console.log(`Server started on port ${port}`);
});
