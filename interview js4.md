Flattening array
function flatten(array) {
  return array.reduce(function(memo, el) {
    var items = Array.isArray(el) ? flatten(el) : [el];
    return memo.concat(items);
  }, []);
}

const flattenedArray = nestedArray.reduce((acc, curr) => acc.concat(curr), []);



joins in mongodb like sql

user auth with api 

Express vs koa

Active directory for external users and internal users


