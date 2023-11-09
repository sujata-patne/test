webpack = https://www.youtube.com/watch?v=IZGNcSuwBZs&t=1s

higher order components
custom hooks
render props

bind, apply, call 
timeout with var and let
es6 features all
arr [1, 4,6, 7 ,8] , [2,3,4,5,8,9]
this is javascript and es6
https://madasamy.medium.com/15-javascript-concepts-that-every-nodejs-programmer-must-to-know-6894f5157cb7
https://medium.com/madhash/simplify-your-javascript-with-these-6-array-methods-db4c278f08c9
https://medium.com/@DaphneWatson/10-useful-javascript-array-methods-8ffe22e7a959
https://hackernoon.com/12-javascript-concepts-that-will-level-up-your-development-skills-b37d16ad7104
https://www.geeksforgeeks.org/7-javascript-concepts-that-every-developer-must-know/

https://www.youtube.com/playlist?list=PL4SfyCkRAwT7LQmbaxcVWRTaQITtCCAwZ
https://javascript.info/
https://daveceddia.com/keeping-up-with-javascript/
https://www.toptal.com/javascript/interview-questions
https://www.javascripttutorial.net/es6/
https://stackoverflow.com/questions/2218999/how-to-remove-all-duplicates-from-an-array-of-objects
Array.from(new Set(arr.map(JSON.stringify))).map(JSON.parse)

virtual vs real DoM
https://www.fullstack.cafe/blog/react-js-interview-questions

useCallback vs useMemo

What are Higher-Order components in reactjs?
What are common memory leak scenarios?
https://auth0.com/blog/four-types-of-leaks-in-your-javascript-code-and-how-to-get-rid-of-them/#Leaks-in-JavaScript 
What are SOLID principles?
abort controller & IntersectionObserver

https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html

https://www.youtube.com/watch?v=K8YELRmUb5o&t=11s

timer in js
restfull api
limitations in css
html5 features
promise in js 
delete variable in js
observable in js
how to test rest api
file operation methods in js
parent-child data communication in react component
What is RX in React?
RxJS (Reactive Extensions Library for JavaScript) is a useful library for reactive programming. The RxJS documentation uses this definition: (Note: RxJS is a library for reactive programming using Observables, to make it easier to compose asynchronous or callback-based code)
lexical scope with arrow function
callstacsk in javascript

center child div horizontally and vertically
change font in 4th div using css - div:nth-child(2) {
flexbox in css 
display=none vs visibility:hidden : visibility:hidden hides the element, but it still takes up space in the layout. 
display:none removes the element from the document. 
what is mediaquery

map-reduce pattern
http-dash protocall 
https://www.youtube.com/watch?v=m8Icp_Cid5o - system design 
asynch operations: https://www.freecodecamp.org/news/synchronous-vs-asynchronous-in-javascript/
event loop https://www.youtube.com/watch?v=8zKuNo4ay8E - Event loop act like gatekeper, check and put callback queue itemes to callstack once it is empty
1. browser API/Web API : stetimeout/setInterval, events like click/change/mouseOver, handler - Callback Queue
2. promises - Job Queue
3. Event Loop : Executes when callstack is empty, pulls tasks first from Job Queue 1-by-1 till all finishes 
then pulls task from callback quest 1-by-1 till all finishes 
i.e. pririty to promises first then web api
https://www.interviewbit.com/node-js-interview-questions/?utm_source=midfunnel&utm_medium=email#enhance-your-node-js-performance-through-clustering
generators and iterators in javascript - https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Iterators_and_Generators
Redux toolkit
Js callstack
React saga
Js prototype 
Typescript

node js folder struxture
prioritize logs in node
secutrity practices 
reverse proxy
authentication 
autherisation
process managersprivate apis

memory managment
memory leak //https://auth0.com/blog/four-types-of-leaks-in-your-javascript-code-and-how-to-get-rid-of-them/
https://blog.meteor.com/an-interesting-kind-of-javascript-memory-leak-8b47d2e7f156
browser windows

https://www.youtube.com/@akshaymarch7 --- eventloop

nodejs architecture https://morioh.com/p/6aad46c296a5?f=5cb7d89d660c8335951ca454&fbclid=IwAR3GvHx_33KGxvUmMhO0Svio5N9VksSG1A3RWMPCWN5hA-8N78AtJeYuIWg
https://blog.risingstack.com/mastering-async-await-in-nodejs/ -- interview
https://www.tutorialspoint.com/nodejs/nodejs_streams.htm

https://www.smashingmagazine.com/2016/07/how-to-use-arguments-and-parameters-in-ecmascript-6/
https://www.interviewbit.com/es6-interview-questions/

gcloud pubsub topics create mytopic

gcloud pubsub topics publish mytopic -message "message"
gcloud pubsub topics list 
gcloud pubsub topics delete test2
gcloud pubsub subscriptions create — topic myTopic mySubscription
gcloud pubsub subscriptions delete Test1
gcloud pubsub subscriptions pull mySubscription — auto-ack — limit=3

3. Describe JS execution Stack and Event Loop functionality.

Console -1
Console -1
For loop - 20 mins -> ! io
db() -> io
Console(3)



Console -1
Console -1
For loop - 20 mins ! io
Await db() -> io
Console(3)



_auth = bmlsa2VzaC5zdXJhbmE6QUtDcDVkTENjR3NYcVZHWkNIc0F4ZjEyem03Z0J2OTdBNmNyeThEd2dvUGVlWmlWTnFCTUJkNlJvazN2NDNEdjJ6eG1EUktnZQ==
always-auth = true
email = nilkesh.surana@hcl.com

_auth="aGVtYW50LnBhdGlsOkFLQ3A1ZlRRbTYyaDlQVFNBYzl0MTI1MmJ5amY1dlB3TktvaUVmS1NXNFk2aXdjWUVNWFBvZEZmQ3lQblFkMTd1M01nS2FTblY="
always-auth=true
email=hemant.patil@hcl.com
registry=https://artifactory.cwp.pnp-hcl.com/artifactory/api/npm/v-ess-npm-dev/
@connections:registry=https://artifactory.cwp.pnp-hcl.com/artifactory/api/npm/v-ess-npm-dev/
@sametime:registry=https://artifactory.cwp.pnp-hcl.com/artifactory/api/npm/sametime-npm-prod/
@enchanted-prod:registry=https://artifactory.cwp.pnp-hcl.com/artifactory/api/npm/quintana-npm-prod/
@enchanted:registry=https://artifactory.cwp.pnp-hcl.com/artifactory/api/npm/quintana-npm/
//artifactory.cwp.pnp-hcl.com/artifactory/api/npm/:_authToken=eyJ2ZXIiOiIyIiwidHlwIjoiSldUIiwiYWxnIjoiUlMyNTYiLCJraWQiOiJjaVFGa0N5WXJiQW00ekxJZDRPRWFfNkZGN3VpblMzRmFKeDFDSGswbXlVIn0.eyJzdWIiOiJqZnJ0QDAxYzhuZWV3d25nN3h0MHBxMDFhYmMxZzR0XC91c2Vyc1wvaGVtYW50LnBhdGlsIiwic2NwIjoibWVtYmVyLW9mLWdyb3VwczoqIGFwaToqIiwiYXVkIjoiamZydEAwMWM4bmVld3duZzd4dDBwcTAxYWJjMWc0dCIsImlzcyI6ImpmcnRAMDFjOG5lZXd3bmc3eHQwcHEwMWFiYzFnNHRcL3VzZXJzXC9oZW1hbnQucGF0aWwiLCJpYXQiOjE2MjEzMTgwOTQsImp0aSI6IjJmYmI2NDgyLTI0YzQtNDFlZi05Mjg4LWY1ZjJmMzNkODQwMiJ9.KLOh1U-1Ne_LigWUT_ytpE-_D3EuCv8g0UGzOJKRXQ1Zd2pvKrPK-blsEM0TfKwkr4IhpTErWbIcPaQAxt1vGoXANu0X06cHAjAW6JT_ZOt7S2vuiUwpwpp1v-iazKiXaS8wRJtyYBVOd2UK3q1ttf20jSZYCOa_rNm-VsEliBw7_bpq18MjtjKok1ZWVz5KP6Z7cPqEZTnYug9awydgIi1Q7mhRxNat4cIe_Qsey5nhMk3NiHgNz80cY8g0MCU3g3Qx40UUShPif9S4swzbi8VaB-pt-nB6RJ51f5dkb1Z148uMJnmvPhwt3qMqnTfIMlnlV4y2kL2pYTYVzR6sbA


email=sujatashankar.patne@hcl.com
registry=https://artifactory.cwp.pnp-hcl.com:443/artifactory/api/npm/v-ess-npm-dev/
@connections:registry=https://artifactory.cwp.pnp-hcl.com/artifactory/api/npm/v-ess-npm-dev/
//artifactory.cwp.pnp-hcl.com/artifactory/api/npm/v-ess-npm-dev/:_password="QUtDcDVlMmdNeDgyZVVydEUzM2VTVFhzUEZkYVdmN3E4aHRzUXRCYkVNRURBN29UWTFYS20yR2J4VFdYOTc5ZGpqWFlGRUxQZg=="
//artifactory.cwp.pnp-hcl.com/artifactory/api/npm/v-ess-npm-dev/:username=sujatashankar.patne
//artifactory.cwp.pnp-hcl.com/artifactory/api/npm/v-ess-npm-dev/:email=sujatashankar.patne@hcl.com
//artifactory.cwp.pnp-hcl.com/artifactory/api/npm/v-ess-npm-dev/:always-auth=true
@expertise360:registry=https://artifactory.cwp.pnp-hcl.com/artifactory/api/npm/isscapps-npm-local/
//artifactory.cwp.pnp-hcl.com/artifactory/api/npm/isscapps-npm-local/:_password="QUtDcDVlMmdNeDgyZVVydEUzM2VTVFhzUEZkYVdmN3E4aHRzUXRCYkVNRURBN29UWTFYS20yR2J4VFdYOTc5ZGpqWFlGRUxQZg=="
//artifactory.cwp.pnp-hcl.com/artifactory/api/npm/isscapps-npm-local/:username=sujatashankar.patne
//artifactory.cwp.pnp-hcl.com/artifactory/api/npm/isscapps-npm-local/:email=sujatashankar.patne@hcl.com
//artifactory.cwp.pnp-hcl.com/artifactory/api/npm/isscapps-npm-local/:always-auth=true
@sametime:registry=https://artifactory.cwp.pnp-hcl.com/artifactory/api/npm/sametime-npm-prod/
@enchanted-prod:registry=https://artifactory.cwp.pnp-hcl.com/artifactory/api/npm/quintana-npm-prod/
//artifactory.cwp.pnp-hcl.com/artifactory/api/npm/quintana-npm-prod/:_authToken=eyJ2ZXIiOiIyIiwidHlwIjoiSldUIiwiYWxnIjoiUlMyNTYiLCJraWQiOiJjaVFGa0N5WXJiQW00ekxJZDRPRWFfNkZGN3VpblMzRmFKeDFDSGswbXlVIn0.eyJzdWIiOiJqZnJ0QDAxYzhuZWV3d25nN3h0MHBxMDFhYmMxZzR0XC91c2Vyc1wvc3VqYXRhc2hhbmthci5wYXRuZSIsInNjcCI6Im1lbWJlci1vZi1ncm91cHM6KiBhcGk6KiIsImF1ZCI6ImpmcnRAMDFjOG5lZXd3bmc3eHQwcHEwMWFiYzFnNHQiLCJpc3MiOiJqZnJ0QDAxYzhuZWV3d25nN3h0MHBxMDFhYmMxZzR0XC91c2Vyc1wvc3VqYXRhc2hhbmthci5wYXRuZSIsImlhdCI6MTYyMDEyNzgzNSwianRpIjoiMGFmNjc2ZDAtYTA2MC00Yzc3LWI4ZTUtZjQwNjcyZTAxNmVmIn0.S0z90PaSJaBVBfTovw75zfju9m_J6EPxBjHusUhr8zYsdSD1VQ2eEQHdCP_OpI1Im1__wW9Gt4lOGT_mBlXGaGbFUxHnJqy9O85bF_OFwzD5Lj-x1xtRTyzEa1evlMumQKgHprPHv3-hCOE8l7bAfqusxQ3bJEo02GwDEYrng_2FPAXkFqvlhz7a2OJjiMRB6u2kA6JWz8JhzbU0gZDNFViGGjpD268gv8wYhnuQjpmLUNa2tQasekEMKr_tamzdCa5UHn5Ch9DT_32Viic8c97z8sKNVPXPsea6WpXD5bt8FQypm1VYU1jDrRR_yZ_dy_xLbwVAQ-3cDpG74WiOMg

