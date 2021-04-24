function addToCart(id, name, donGia, avatar){
    fetch('/api/cart',{
          'method':'post',
          'body': JSON.stringify({
                'id':id,
                'name':name,
                'donGia':donGia,
                'avatar':avatar
          }),
          'headers': {
            'Content-Type': 'application/json'
          }

    }).then(res => res.json()).then(data => {
            console.info(data);
            location.reload()
            var stats = document.getElementById("cart-stats")
            var total_number = document.getElementById("total_number")
            var number = document.getElementById("number_quantity")
            var total_price = document.getElementById("total_price")
             total_number.innerText = `${data.total_quantity}`;
             total_price.innerText = `${data.total_amount} VNĐ`;
             number.innerText = `${data.total_quantity}`;

    }).catch(err=> console.log(err))
}
function minusToCart(id, name, donGia, avatar){
    fetch('/api/minus_cart',{
          'method':'post',
          'body': JSON.stringify({
                'id':id,
                'name':name,
                'donGia':donGia,
                'avatar':avatar
          }),
          'headers': {
            'Content-Type': 'application/json'
          }

    }).then(res => res.json()).then(data => {
            console.info(data);
            location.reload()
            var stats = document.getElementById("cart-stats")
            var total_number = document.getElementById("total_number")
            var number = document.getElementById("number_quantity")
            var total_price = document.getElementById("total_price")
             total_number.innerText = `${data.total_quantity}`;
             total_price.innerText = `${data.total_amount} VNĐ`;
             number.innerText = `${data.total_quantity}`;

    }).catch(err=> console.log(err))
}

function pay() {
    fetch('/api/pay', {
        method: "post",
        headers: {
            'Content-Type': 'application/json'
        }
    }).then(res => res.json()).then(data => {
        alert(data.message);
        location.reload();
    }).catch(err => {
        location.href = '/loginuser';
    })
}

function hien(){
            document.getElementById("hien").style.display ="block"
    }

 function hien2(){
            document.getElementById("hien2").style.display ="block"
    }