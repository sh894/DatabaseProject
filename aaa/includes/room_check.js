function add_check(){
  if (room_add.roomcode.value==""){
    alert("�����뷿���ţ�");
		room_add.roomcode.focus();		
		return (false);
	}
  if (room_add.roomno.value==""){
    alert("�����뷿����룡");
		room_add.roomno.focus();		
		return (false);
	}
  if (room_add.classno.value==""){
    alert("�������������");
		room_add.classno.focus();		
		return (false);
	}	
  if (room_add.roomstate.value==""){
    alert("�����뷿��״̬��");
		room_add.roomstate.focus();		
		return (false);
	}	
	else
	  document.room_add.submit();
}

function modify_check(){
  if (room_modify.roomno.value==""){
    alert("�����뷿����룡");
		room_modify.roomno.focus();		
		return (false);
	}
  if (room_modify.classno.value==""){
    alert("�������������");
		room_modify.classno.focus();		
		return (false);
	}	
  if (room_modify.roomstate.value==""){
    alert("�����뷿��״̬��");
		room_modify.roomstate.focus();		
		return (false);
	}	
	else
	  document.room_modify.submit();
}

function delete_check()
{
var msg = "�����ȷ��Ҫɾ����\n\n��ȷ�ϣ�";
if (confirm(msg)==true){return true;}
else{return false;}
}