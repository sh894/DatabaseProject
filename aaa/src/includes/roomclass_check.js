function add_check(){
  if (roomclass_add.classno.value==""){
    alert("���������ţ�");
		roomclass_add.classno.focus();		
		return (false);
	}
  if (roomclass_add.classname.value==""){
    alert("������������ƣ�");
		roomclass_add.classname.focus();		
		return (false);
	}
  if (roomclass_add.beds.value==""){
    alert("�����봲λ����");
		roomclass_add.beds.focus();		
		return (false);
	}	
  if (roomclass_add.price.value==""){
    alert("�����붨�ۣ�");
		roomclass_add.price.focus();		
		return (false);
	}	
	else
	  document.roomclass_add.submit();
}

function modify_check(){
  if (roomclass_modify.classname.value==""){
    alert("������������ƣ�");
		roomclass_modify.classname.focus();		
		return (false);
	}
  if (roomclass_modify.beds.value==""){
    alert("�����봲λ����");
		roomclass_modify.beds.focus();		
		return (false);
	}	
  if (roomclass_modify.price.value==""){
    alert("�����붨�ۣ�");
		roomclass_modify.price.focus();		
		return (false);
	}	
	else
	  document.roomclass_modify.submit();
}

function delete_check()
{
var msg = "�����ȷ��Ҫɾ����\n\n��ȷ�ϣ�";
if (confirm(msg)==true){return true;}
else{return false;}
}