function add_check(){
  if (room_add.roomcode.value==""){
    alert("请输入房间编号！");
		room_add.roomcode.focus();		
		return (false);
	}
  if (room_add.roomno.value==""){
    alert("请输入房间号码！");
		room_add.roomno.focus();		
		return (false);
	}
  if (room_add.classno.value==""){
    alert("请填入分类名！");
		room_add.classno.focus();		
		return (false);
	}	
  if (room_add.roomstate.value==""){
    alert("请填入房间状态！");
		room_add.roomstate.focus();		
		return (false);
	}	
	else
	  document.room_add.submit();
}

function modify_check(){
  if (room_modify.roomno.value==""){
    alert("请输入房间号码！");
		room_modify.roomno.focus();		
		return (false);
	}
  if (room_modify.classno.value==""){
    alert("请填入分类名！");
		room_modify.classno.focus();		
		return (false);
	}	
  if (room_modify.roomstate.value==""){
    alert("请填入房间状态！");
		room_modify.roomstate.focus();		
		return (false);
	}	
	else
	  document.room_modify.submit();
}

function delete_check()
{
var msg = "您真的确定要删除吗？\n\n请确认！";
if (confirm(msg)==true){return true;}
else{return false;}
}