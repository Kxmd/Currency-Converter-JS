const input = require('sync-input');

const currencies = {
  "JPY": 113.5,
  "EUR": 0.89,
  "RUB": 74.36,
  "GBP": 0.75,
  "USD": 1
}

function convert(fromCurrency, toCurrency){
  let amount = input("Amount:");
  amount = parseFloat(amount);
  if (amount < 1 ) {
    console.log("The amount can not be less than 1");
  } else if (isNaN(amount)) {
    console.log("The amount has to be a number");
  } else {
      let result = amount * currencies[toCurrency] / currencies[fromCurrency];  
      console.log(`Result: ${amount} ${fromCurrency} equals ${result.toFixed(4)} ${toCurrency}`);
  }
}

console.log("Welcome to Currency Converter!");
console.log(`1 USD equals  1 USD
1 USD equals  113.5 JPY
1 USD equals  0.89 EUR
1 USD equals  74.36 RUB
1 USD equals  0.75 GBP`);

while(true){
  console.log("What do you want to do?");
  console.log("1-Convert currencies 2-Exit program");
  let usersChoice = input(" ");
  if (usersChoice !== "1" && usersChoice !== "2"){
    console.log("Unknown input");
    continue;
  } else if (usersChoice === "2"){
    break;
  }
  console.log("What do you want to convert?");
  let firstCurrency = input("From:").toUpperCase();
  if (currencies.hasOwnProperty(firstCurrency)) {
    let secondCurrency = input("To:").toUpperCase();
    if (currencies.hasOwnProperty(secondCurrency)) {
      convert(firstCurrency, secondCurrency);
      } else {
        console.log("Unknown currency");
    } 
    }else {
    console.log("Unknown currency");
  }
}
console.log("Have a nice day!");
