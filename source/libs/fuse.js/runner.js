const util = require('util')

const Fuse = require('./src')
// const items = ['t te tes test tes te t']

// const fuse = new Fuse(items, {
//   showMatches: true,
//   // findAllMatches: true,
//   minMatchCharLength: 2,
//   verbose: true
// })

// var result = fuse.search('test')
// console.log(util.inspect(result, false, null))

const needle = "Ildaf Samiev";
const haystack = [
  { name: "Ildaf Rafi Samier" },
  { name: "Ildaf Rafi Saitor" }
];

var fuse = new Fuse(haystack, {
  includeScore: true,
  // tokenize: true,
  keys: ["name"],
  verbose: true
});

const result = fuse.search(needle);