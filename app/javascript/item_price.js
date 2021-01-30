window.addEventListener('load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addProfitInput = document.getElementById("profit")
  // ここでidを取得
  priceInput.addEventListener("input", () => {
    // 入力された時に
    const inputValue = priceInput.value;
    // 数字を取得
    console.log(inputValue);
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    addProfitInput.innerHTML = Math.floor(inputValue * 0.9)
  })

  const taxInput = document.getElementById("add-tax-price");
  console.log(taxInput);
  taxInput.addEventListener("input", () => {
    console.log("イベント発火");
  })

  const profitInput = document.getElementById("profit"); 
  console.log(profitInput);
  profitInput.addEventListener("input", () => {
    console.log("イベント発火");
  })

});
