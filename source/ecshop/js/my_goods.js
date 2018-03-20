/* $Id : my_goods.js 4865 2007-01-31 14:04:10Z paulgao $ */

function add_faq(){
    var faq_table=document.getElementById("faq-table-td");

    var table = document.createElement("table");
    table.width = "80%";
    table.className="faq_table";

    var tr1=document.createElement("tr");

    var td1=document.createElement("td");
    td1.width=20;
    var a=document.createElement("a");
    a.innerHTML="[-]";
    a.addEventListener('click',function(e){
        alert(2);
    });
    var td2=document.createElement("td");
    td2.width=50;
    td2.innerHTML="问题标题";
    var td3=document.createElement("td");

    var title_input=document.createElement("input");
    title_input.name="fqa_title[]";
    td3.appendChild(title_input);


    td1.appendChild(a);
    tr1.appendChild(td1);
    tr1.appendChild(td2);
    tr1.appendChild(td3);

    var tr2=document.createElement("tr");
    var td2_1=document.createElement("td");
    var td2_2=document.createElement("td");
    td2_2.innerHTML="问题内容";
    var td2_3=document.createElement("td");
    var content_input=document.createElement("textarea");
    content_input.name="fqa_content[]";
    content_input.cols=40;
    content_input.rows=3;
    td2_3.appendChild(content_input);

    tr2.appendChild(td2_1);
    tr2.appendChild(td2_2);
    tr2.appendChild(td2_3);

    table.appendChild(tr1);
    table.appendChild(tr2);
    faq_table.appendChild(table);

}