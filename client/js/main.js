let data;

generateHTML();

async function generateHTML() {
  data = await fetchClothesData();
  setupColorSelection(data);
}

function setupColorSelection(data) {
  const colorContainer = document.querySelector("#colorSelection");
  const colors = [...new Set(data.map((item) => item.ColorName))];

  colors.forEach((color) => {
    const label = document.createElement("label");
    const radioButton = document.createElement("input");
    radioButton.type = "radio";
    radioButton.name = "color";
    radioButton.value = color;
    radioButton.onclick = () => displaySizesForColor(color);
    label.appendChild(radioButton);
    label.append(color);
    colorContainer.appendChild(label);
  });
}

function displaySizesForColor(color) {
  const sizeContainer = document.querySelector("#sizeSelection");
  sizeContainer.innerHTML = "選擇尺寸：";
  sizeContainer.style.display = "block";

  const sizes = data.filter((item) => item.ColorName === color);
  sizes.forEach((size) => {
    const label = document.createElement("label");
    const radioButton = document.createElement("input");
    radioButton.type = "radio";
    radioButton.name = "size";
    radioButton.value = size.SizeName;
    radioButton.onclick = () => displayStock(size.Quantity);
    label.appendChild(radioButton);
    label.append(size.SizeName);
    sizeContainer.appendChild(label);
  });
}

function displayStock(quantity) {
  const stockDisplay = document.getElementById("stockDisplay");
  stockDisplay.innerHTML = `庫存數量：${quantity}`;
}

async function fetchClothesData() {
  const response = await fetch("http://localhost:3000/api/clothes/1");
  const data = await response.json();
  return data;
}
