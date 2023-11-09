https://www.simplilearn.com/tutorials/nodejs-tutorial/nodejs-interview-questions

So, if Redux and useReducer were to be compared

Redux:

centralised state
forges more de-coupling
has middlewares: Redux thunk and Redux logger
actions can only hit one Store
maybe more suitable for big projects

useReducer:
local state
no wrapper component
needs useContext in order to reinvent the wheel
comes with other native hooks
no extra dependencies needed
multiple stores maybe(actually reducers that can act as store)
maybe more suitable for small projects


https://www.w3schools.com/react/react_usecallback.asp

var shouldRun=true
setTimeout(function(){shouldRun=false},1000)
while(shouldRun){
console.log("Running")
}

let a= {a:"1"}
let b= {a:"1"}
console.log(a === b);
console.log(a == b);
let obj = {
 firstname: "Prajakta",
 lastname: "Narayankar",
 DOB: new Date(),
 family: [{
 name: "mother name",
 relation: "mother"
 }, {
 name: "father name",
 relation: "father"
 }],
 fullname: function () {
 return this.firstname + this.lastname
 },
 contact: {
 email: "prajakta.n@ril.com",
 phone: {
 personal: "9987722953",
 office: "8356903596"
 }
 },
 address: {
 current: {
 city: "thane",
 state: "maharashtra"
 },
 permenant: {
 city: "mumbai",
 state: "maharashtra"
 }
 }
}

function findKeyValue(obj, searchkey,result = []){
    let r=result;
    Object.keys(obj).forEach(key =>{
        let value = obj[key];
        if(key === searchkey && typeof value !== 'object'){
            r.push(value);
        }else if(typeof value == 'object' && key === searchkey){
             r.push(value);
        }else if(typeof value == 'object'){
             //console.log(key, value);
             findKeyValue(value, searchkey, r);
        }
    })
    return r;
}

let res = findKeyValue(obj, 'name');
console.log(res);

let str1 = 'my name is hemant';

====================================

const convertDateFormat = (date) => {
    var strArray=['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    var d = date.getDate();
    var m = strArray[date.getMonth()];
    var y = date.getFullYear();
    return '' + d + ' ' + m + ' ' + y;
}
function getReverse(str){
    return new promise(function(resolve,reject) {
        if(err){
            return reject(err)
        }
        try{
            resolve(str.split('').reverse().join('').split(" ").reverse().join(" "));
        }catch(e){
            reject(e);
        }
    })
};

getReverse(string).then(function(val) {
    console.log(val);
}.catch(function(err) {
    console.log(err);
})
)

console.log(str1.split('').reverse().join('').split(" ").reverse().join(" "));
