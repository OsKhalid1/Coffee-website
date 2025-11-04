let prods = [];

const requestOptions = {
  method: "GET",
  redirect: "follow"
};

fetch("http://localhost/Coffee-website/getProduct.php", requestOptions)
  .then((response) => response.json()) 
  .then((products) => {
    console.log(products);
    prods = products; 
    renderproducts(products); 
  })
  .catch((error) => console.error(" Fetch Error:", error));

let cart = JSON.parse(localStorage.getItem('cartUser')) || [];





function renderproducts(products) {
  const productsContainer = document.getElementById("coffee");
  if (!productsContainer) return; 

  productsContainer.innerHTML = ""; 
  products.forEach(prod => {
    productsContainer.innerHTML += `
      <div class="col-6 col-md-4 col-lg-3 mb-3">
        <div class="product-card ">
          <img src="dashbored/images/tea-photo/${prod.image}" class="img-fluid" alt="${prod.name}">
          <h6>${prod.name}</h6>
          <p>${prod.price} SAR</p>
          <button class="btn" style="background-color:rgba(170, 156, 133, 0.29)"; onclick="addTocart(${prod.id})">Order</button>
        </div>
      </div>`;
  });
}


function addTocart(id) {
  let Cart = JSON.parse(localStorage.getItem('cartUser')) || [];
  id = Number(id);
  let product = prods.find(p => p.id == id);
  if (!product) return;
  product.quantity = 1;
  Cart.push(product);
  localStorage.setItem('cartUser', JSON.stringify(Cart));
  alert(`${product.name} added to cart!`);
  getCartItem();
}



function getCartItem() {
  let Cart = JSON.parse(localStorage.getItem('cartUser')) || [];
  let cartContainer = document.querySelector('.cart-items');
  let cartTotal = document.querySelector('.cart-total');
  cartContainer.innerHTML = "";
  let total = 0;

  if (Cart.length === 0) {
    cartContainer.innerHTML = "<p>Your cart is empty </p>";
    cartTotal.textContent = "0 SAR";
    return;
  }

  Cart.forEach((item, index) => {
    let price = parseFloat(item.price);
    let itemTotal = price * item.quantity;
    total += itemTotal;

    cartContainer.innerHTML += `
      <div class="cart-item">
        <img src="${item.imaga}" class="cart-img"/>
        <div>
          <h5>${item.name}</h5>
          <p>${item.price} SAR × ${item.quantity}</p>
        </div>
        <div>
          <button onclick="changeQuantity(${index}, -1)">−</button>
          <button onclick="changeQuantity(${index}, 1)">+</button>
          <button onclick="removeItem(${index})" class="remove-btn">Remove</button>
        </div>
      </div>`;
  });

  cartTotal.textContent = `${total.toFixed(2)} SAR`;
}


function removeItem(index) {
  let Cart = JSON.parse(localStorage.getItem('cartUser')) || [];
  Cart.splice(index, 1);
  localStorage.setItem('cartUser', JSON.stringify(Cart));
  getCartItem(); 
}



document.addEventListener('DOMContentLoaded', function () {
  const checkoutBtn = document.querySelector('.Checkout-btn');
  if (checkoutBtn) {
    checkoutBtn.addEventListener('click', function () {
      handleCheckout();
    });
  }
});

function handleCheckout() {
  let Cart = JSON.parse(localStorage.getItem('cartUser')) || [];

  if (Cart.length === 0) {
    alert('Your cart is empty! Please add items before checkout.');
    return;
  }

  
  let total = 0;
  Cart.forEach(item => {
    total += parseFloat(item.price) * item.quantity;
  });

  
  if (!confirm(`Confirm checkout?\nTotal: ${total.toFixed(2)} SAR\n\nProceed with order?`)) {
    return;
  }

  
  fetch('http://localhost/Coffee-website/checkout.php', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      items: Cart,
      total: total.toFixed(2)
    })
  })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        alert(`✅ Order placed successfully!\nOrder number : ${data.order_id || 'N/A'}\nTotal: ${total.toFixed(2)} SAR`);
        localStorage.removeItem('cartUser');
        getCartItem();
        setTimeout(() => {
          window.location.href = 'index.html';
        }, 150);

      }
    });

}

function changeQuantity(index, change) {
  let Cart = JSON.parse(localStorage.getItem('cartUser')) || [];
  if (Cart[index]) {
    Cart[index].quantity += change;
    if (Cart[index].quantity <= 0) {
      Cart.splice(index, 1); 
    }
    localStorage.setItem('cartUser', JSON.stringify(Cart));
    getCartItem(); 
  }
}

// ------------------Cart end ----------------\\


//---------------Serach bar start ---------------\\


const selectBox = document.querySelector(".select_box");
if (selectBox) {
  selectBox.addEventListener("submit", function (e) {
    e.preventDefault();
    let term = document.querySelector(".searchbar input").value.trim();

    if (term) {
      fetch(`http://localhost/Coffee-website/Search.php?q=${encodeURIComponent(term)}`)
        .then(res => res.json())
        .then(data => renderproducts(data))
        .catch(err => console.error(err));
    }
  });
}

const searchInput = document.getElementById("searchInput");
if (searchInput) {
  searchInput.addEventListener("input", function () {
    const term = this.value.toLowerCase().trim();
    const filteredProducts = prods.filter(prod =>
      prod.name.toLowerCase().includes(term)
    );
    if (filteredProducts.length > 0) {
      renderproducts(filteredProducts);
    } else {
      document.getElementById("coffee").innerHTML =
        `<p style="text-align:center;color:#777;">No products found </p>`;
    }
  });
}


const searchForm = document.querySelector(".select_box");
if (searchForm) {
  searchForm.addEventListener("submit", function (e) {
    e.preventDefault();
  });
}


