
function addToSell() {
    id = document.getElementById("idsach").value;
    idk = document.getElementById("idkhach").value;
    fetch('/api/sellcart', {
        'method': "post",
        'body': JSON.stringify({
            "id": id,
            "idk": idk
        }),
        'headers': {
            'Content-Type': 'application/json'
        }
    }).then(res => res.json()).then(data => {
        console.info(data);
        location.reload();
//
        var value = parseInt(document.getElementById(id ).value) ;
        document.getElementById(id ).value = value + 1;
        var value = parseInt(document.getElementById(idk ).value) ;
        document.getElementById(idk).value = value + 1;
    }).catch(err => {
        console.log(err);
    })

    // promise --> await/async
}

// dùng để thanh toán cho khách hàng.
function submitBuy() {
    fetch('/api/submit-buy', {
        method: "post",
        headers: {
            'Content-Type': 'application/json'
        }
    }).then(res => res.json()).then(data => {
        alert(data.message);
        location.reload();
    }).catch(err => {
        console.log(err);
    })
}


// dùng để add vào cái cart sách nhập
function addBookCart() {
    id = document.getElementById("idsach").value;
    fetch('/api/bookcart', {
        method: "post",
        body: JSON.stringify({
            "id": id
        }),
        headers: {
            'Content-Type': 'application/json'
        }
    }).then(res => res.json()).then(data => {
        console.info(data);
        location.reload();
//
        var value = parseInt(document.getElementById(idsak ).value) ;
        document.getElementById(idsak ).value = value + 1;
    }).catch(err => {
        console.log(err);
    })

}
//submit vấn đề thêm sách
function submitAddBook() {
    fetch('/api/submit-buybook', {
        method: "post",
        headers: {
            'Content-Type': 'application/json'
        }
    }).then(res => res.json()).then(data => {
        alert(data.message);
        location.reload();
    }).catch(err => {
        console.log(err);
    })
}




