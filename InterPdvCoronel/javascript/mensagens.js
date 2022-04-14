function cadVenda(codigo, produto, valUnitario, quantidade, subtotal,) {
    var tb = document.getElementById("gridVenda");
    var qtdlinhas = tb.rows.length;
    var linha = tb.insertRow(qtdlinhas);

    var cellCodigo = linha.insertCell(0);
    var cellProduto = linha.insertCell(1);
    var cellValUnitario = linha.insertCell(2);
    var cellQuantidade = linha.insertCell(3);
    var cellSubtotal = linha.insertCell(4);


    cellCodigo.innerHTML = codigo;
    cellProduto.innerHTML = produto;
    cellValUnitario.innerHTML = valUnitario;
    cellQuantidade.innerHTML = quantidade;
    cellSubtotal.innerHTML = subtotal;



}