window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    console.log(addTaxDom);

    const profitNum = document.getElementById("profit")
    const addTaxDom_result = inputValue * 0.1
    console.log(addTaxDom_result)
    profitNum.innerHTML = (Math.floor(inputValue - addTaxDom_result));
    console.log(profitNum);
  })
})