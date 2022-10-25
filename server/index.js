const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const authRouter = require("./routes/auth");

//const PORT = process.env.PORT;

const app = express();

app.use(cors());
app.use(express.json());
app.use(authRouter);

const DB = 
    "mongodb+srv://skywalker:rkdtmfrl87!@cluster0.sive0ke.mongodb.net/?retryWrites=true&w=majority";

mongoose.connect(DB).then(() => {
    console.log("Connection Success!");
    })
    .catch((err) => {
        console.log(err);
});