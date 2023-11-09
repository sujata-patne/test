lexical scope with arrow function
node js folder struxture
prioritize logs in node
secutrity practices 
reverse proxy
private apis
authentication 
autherisation
process managers
memory managment
memory leak
browser windows

modules, stream, buffer, callback, pipeline, events in nodejs
https://www.interviewbit.com/es6-interview-questions/

git submodule
https://www.simplilearn.com/tutorials/kubernetes-tutorial/getting-started-with-kubernetes

https://blog.risingstack.com/mastering-async-await-in-nodejs/
https://www.softwaretestinghelp.com/javascript-interview-questions/
https://www.javatpoint.com/node-js-interview-questions
https://medium.com/docler-engineering/applying-solid-to-react-ca6d1ff926a4
https://www.geeksforgeeks.org/how-to-use-single-responsibility-principle-in-reactjs/
https://medium.com/engineered-publicis-sapient/javascript-es6-es7-es10-where-are-we-8ac044dfd964
web workers vs serviceworkers
for in vs for of
foreach vs map vs for vs map
map vs object
react.component vs pure component
even propagation and event bubbling
synthetic events

https://www.youtube.com/watch?v=JY4ggffeLXA - setimmidieat vs process.nextTick - 
callstack vs heap memory : Only primitive types passed by value (Number, Boolean, references to objecs) are stored on the stack. Everything else 
is allocated dynamically from the shared pool of memory called heap


function currying, lexical env/scope,

========================================
getReverse("my name is hemant");

function getReverse(str){
   console.log(str.split("").reverse().join("").split(" ").reverse().join(" "));
}

function getReverse(str){
    return new promise(functin(resolve,reject) {
        if(err){
            reject(err)
        }
		try{
			resolve(str.split('').reverse().join('')
		}
		catch(e){
			rejuect(e)
		}
    })
};

let String = "India is my country"
getReverse(string).then(function(val) {
    console.log(val);
}.catch(function(err) {
    console.log(err);
})
)
=================================================================================================

getCounts('aabbcab')

function getCounts(str){
    let count = new Map()
    let ch;
    let max = 0;
    let charMax =''
    for(const key of str){
        let cnt = 0
        count.set(key, cnt)
    }

    for(const key of str){
        let temp = count.get(key);
        count.set(key, temp+1);
    }

    for(const[k,v] of count){
        //console.log(k,v)
        if(v > max){
            max = v;
            charMax = k;
        }
        if(v == max && k != charMax){
            charMax = charMax + ',' + k
        }
    }
    console.log(charMax, max);

}
===================================================================================
let ar = [1,2,3,4,5];

Array.prototype.toSString = function(){
    let Str =  this.map(item =>{
      return item +"-";
    })
    
   let val =  Str.toString().split(',').join('').slice(0,-1);

   return val;
}

let value = ar.toSString();
console.log(value); //1-2-3-4-5

======================================================================================

function sum(num1) {
    let cnt = num1;
    return function by(num2){
        if(num2 == undefined){
            return cnt;
        }else{
            cnt += num2;
            return by;
        }
    }
}

const add= x => y => (y !== undefined) ? add(x + y) : x;

const add2 = x => y => {return x+y};

console.log(add2(1)(4))
console.log(add(1)(4)(66)(35)(0)());

===================================================================================
https://stackoverflow.com/questions/2218999/how-to-remove-all-duplicates-from-an-array-of-objects

One liners with filter ( Preserves order )

Find unique id's in an array.

arr.filter((v,i,a)=>a.findIndex(t=>(t.id===v.id))===i)
If the order is not important, map solutions will be faster: Solution with map

Unique by multiple properties ( place and name )

arr.filter((v,i,a)=>a.findIndex(t=>['place','name'].every(k=>t[k] ===v[k]))===i)
Unique by all properties (This will be slow for large arrays)

arr.filter((v,i,a)=>a.findIndex(t=>(JSON.stringify(t) === JSON.stringify(v)))===i)
Keep the last occurrence.

arr.filter((v,i,a)=>a.findLastIndex(t=>(t.place === v.place))===i)

function removeDuplicate(arr , key){
  arr.reduce((ac, ele) => {
    if(!ac.find(el => el[key] === ele[key])){
         ac.push(element);
    }
    return ac;
  },[])
  
}

// return Array.from(new Set(arrObj.map(JSON.stringify))).map(JSON.parse)

function removeDuplicate(arr, key){
  let result = [];
  let lookup = {}
  arr.forEach(element =>{
     if(!looup[element[key]]){
       looup[element[key]] = true;
       result.push(element)
     }
  });
  return result;
}

describe('removeDuplicate', ()=>{
	it('should remove duplicates from array based on key', ()=>{
    const arr = [
      {name:'hemant', age:30},
      {name:'ritesh', age:23},
      {name:'patil', age:30},
      {name:'hemant', age:28},
    ]
    const result = removeDuplicate(arr, 'name');
    expect(result).toEqual([
      {name:'ritesh', age:23},
      {name:'patil', age:30}
    ])
  })
})

====================================================================

function sortWord(str){
    let strArr = str.split('').sort();
    return strArr.join('');
}

function getAnagram(arr){
    let result = {}
	for(word of arr){
        let sortedWord = sortWord(word);
        
        if(result[sortedWord] != null){
             result[sortedWord].push(word)
        }else{
            result[sortedWord] = [word];
        }
    }

    return result;
}

let arr = ['cat', 'bat', 'ate', 'xyz', 'abc', 'yzx', 'eat', 'tea', 'tab'];

console.log(getAnagram(arr));

What are the new features introduced in ES6
Define let and const keywords.
What is the closure in JavaScript?
What is the generator function?
What is Indexing noSQL?
What is tinyUrl?
Describe JS execution Stack and Event Loop functionality?
foreach vs map vs for vs map
map vs object
react.component vs pure component
Reverse sentence in js like "My Name is Sujata"
Create component in Reacjs with prop and state

1) What are the new features introduced in ES6
	Let and const keywords.
	Default Parameters.
	Arrow functions.
	Template Literals.
	Object Literals.
	Rest and spread operators.
	Destructuring assignment.
	Modules, Classes, Generators, and iterators.
	Promises, and many more.
2) Define let and const keywords.
	let: The variables declared using let keyword will be mutable, i.e., the values of the variable can be changed. It is similar to var keyword except that it provides block scoping.

	const: The variables declared using the const keyword are immutable and block-scoped. The value of the variables cannot be changed or re-assigned if they are declared by using the con	st keyword.

3) What is the closure in JavaScript?
A closure is the combination of a function bundled together (enclosed) with references to its surrounding state (the lexical environment). ... 
In JavaScript, closures are created every time a function is created, at function creation time
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures
In JavaScript, closures are the primary mechanism used to enable data privacy. When you use closures for data privacy, the enclosed variables are only in scope within the containing (outer) function. You can't get at the data from an outside scope except through the object's privileged methods

4) 7. What is the generator function?
This is a newly introduced feature in ES6. The Generator function returns an object after generating several values over time. 
We can iterate over this object and extract values from the function one by one. A generator function returns an iterable object when called. 
In ES6, we use the * sign for a generator function along with the new ‘yield' keyword.

 function *Numbers() {
    let num = 1;
    while(true) {
        yield num++;
    }
}
  
var gen = Numbers();
 
// Loop to print the first
// 5 Generated numbers
for (var i = 0; i < 5; i++) {
 
    // Generate the next number
    document.write(gen.next().value);
 
    // New Line
    document.write("<br>");
}

What is Indexing?
Indexing is the process of associating a key with the location of a corresponding data record. There are many indexing data structures used in NoSQL databases. 
We will briefly discuss some of the more common methods; namely, B-Tree indexing, T-Tree indexing, and O2-Tree indexing.

What is tinyUrl?
TinyURL is a free URL shortening service that produces short, memorable alias URLs for existing web pages. It enables users to enter a long URL and add a custom parameter to create the shortened URL. This URL then redirects to the web page from the original URL. The shortened URL never expires, so as long as the destination URL is the same, the shortened version will always be functional.