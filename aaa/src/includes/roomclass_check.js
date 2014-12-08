function add_check(){
  if (roomclass_add.classno.value==""){
    alert("请输入分类号！");
		roomclass_add.classno.focus();		
		return (false);
	}
  if (roomclass_add.classname.value==""){
    alert("请输入分类名称！");
		roomclass_add.classname.focus();		
		return (false);
	}
  if (roomclass_add.beds.value==""){
    alert("请填入床位数！");
		roomclass_add.beds.focus();		
		return (false);
	}	
  if (roomclass_add.price.value==""){
    alert("请填入定价！");
		roomclass_add.price.focus();		
		return (false);
	}	
	else
	  document.roomclass_add.submit();
}

function modify_check(){
  if (roomclass_modify.classname.value==""){
    alert("请输入分类名称！");
		roomclass_modify.classname.focus();		
		return (false);
	}
  if (roomclass_modify.beds.value==""){
    alert("请填入床位数！");
		roomclass_modify.beds.focus();		
		return (false);
	}	
  if (roomclass_modify.price.value==""){
    alert("请填入定价！");
		roomclass_modify.price.focus();		
		return (false);
	}	
	else
	  document.roomclass_modify.submit();
}

function delete_check()
{
var msg = "您真的确定要删除吗？\n\n请确认！";
if (confirm(msg)==true){return true;}
else{return false;}
}