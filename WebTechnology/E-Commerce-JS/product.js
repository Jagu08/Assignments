var Total = 0 ;
var totalTag = document.getElementById("Total")
function SaveProduct(event) {
var name = document.getElementById("productName");
var Price = document.getElementById("productPrice");
var Quantity = document.getElementById("productQuantity");
var table = document.getElementById("Table");
var Description = document.getElementById("productDescription")
var img = document.getElementById('productImage').files[0];
var ImageURL = (img != undefined) ? URL.createObjectURL(img) : "";
var found = -2;

var img = document.createElement("img");
img.style.width = "50px";
img.style.height = "60px";
img.src = ImageURL

for (var i = 1, row; row = table.rows[i]; i++) {
    if (row.cells[1].innerText === name.value ) {
        row.cells[3].innerText = Number(row.cells[3].innerText) + 1
        found = i;
        break;
    }
}
if (found == -2){
    var tableBody = table.getElementsByTagName("tbody")[0];
var row = tableBody.insertRow(-1);
var cell1 = row.insertCell(0);
var cell2 = row.insertCell(1);
var cell3 = row.insertCell(2);
var cell4 = row.insertCell(3);
var cell5 = row.insertCell(4);
var cell6 = row.insertCell(5);

cell1.appendChild(img)
cell2.innerHTML = name.value;
cell3.innerHTML = Price.value;
cell4.innerHTML = Quantity.value;
cell6.innerHTML = `
<div class = "list-btn">
    <button type="button" class="btn" onclick="Cart(this, '` + ImageURL + `')">Add to Cart</button>
    <button type="button" class="btn" onclick="deleteRow(this);">Delete</button>
</div> `;
cell5.innerHTML = Description.value;
}

}

function deleteRow(btn) {
var row = btn.parentNode.parentNode.parentNode;
row.parentNode.removeChild(row);
}

// cart function 

function Cart(event,strImg) {
var row = event.parentNode.parentNode.parentNode;
var name = row.cells[1].innerText;
var Price = row.cells[2].innerText;
var Quantity = row.cells[3].innerText;
var table = document.getElementById("cTable");

var img = document.createElement("img");

img.style.width = "80px";
img.style.height = "100px";
img.src = strImg;
var found = -2;
console.log('total',Total,Price)
Total = Number(Total) + Number(Quantity*Price)

totalTag.innerText = Total

for (var i = 1, row; row = table.rows[i]; i++) {
    if (row.cells[1].innerText === name ) {
        row.cells[3].innerText = Number(row.cells[3].innerText) + Number(row.cells[3].innerText)/Number(row.cells[2].innerText)
        row.cells[2].innerText = Number(row.cells[2].innerText) + 1
        found = i;
        break;
    }
}
if (found == -2){
    var tableBody = table.getElementsByTagName("tbody")[0];
var row = tableBody.insertRow(-1);
var cell1 = row.insertCell(0);
var cell2 = row.insertCell(1);
var cell3 = row.insertCell(2);
var cell4 = row.insertCell(3);
var cell5 = row.insertCell(4);

cell1.appendChild(img)
cell2.innerHTML = name;
cell3.innerHTML = Quantity; 
cell4.innerHTML = Price;
cell5.innerHTML = `
<div class = "list-btn">
    <button type="button" class="btn" onclick="deleteCart(this);">Delete</button>
</div>      
  `;
}

}

function deleteCart(btn) {

  var row = btn.parentNode.parentNode.parentNode;
  var sub = Number(row.cells[3].innerText)/Number(row.cells[2].innerText)
  row.cells[3].innerText = Number(row.cells[3].innerText) - Number(sub)

  Total = Number(Total) - Number(sub)
  totalTag.innerText = Total
  var delVal = row.cells[2].innerText = Number(row.cells[2].innerText) - 1

if (delVal == 0) {
    row.parentNode.removeChild(row);
}
}
