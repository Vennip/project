<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%! String token=null,status=null;%>
<%@ include file="Ownerheader.jsp"%>
<table><tr><td><p class="blink"><font color="red" size=+2 name="times new roman"><i>DataUser:
<font color="Blue" size=+2><%=(String)session.getAttribute("uid")%></i></P><font></td></tr></table>
<%

Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet i=st.executeQuery("select token,status from token where uid='"+(String)session.getAttribute("uid")+"'");
if(i.next())
{
	token=i.getString(1);
	status=i.getString(2);
}
String u=(String)session.getAttribute("uid");
%><br>
<table border="4" bordercolor="orange" cellpadding="6" cellspacing="6">
<tr>
	<th><font color="003399" size="3" ><strong>UserID</strong></th>
	<th><font color="003399" size="3" ><strong>FileToken</td>
	<th><font color="003399"size="3" ><strong>Action</td>
	<th><font color="003399"size="3" ><strong>Status</td>
</tr>

<tr>
	<td><font size="4" color="339900"><strong><%=(String)session.getAttribute("uid")%></td>
	<td><font size="4" color="ff3300"><%=token%></td>
    <td><a href="duplToken.jsp?uid=<%=u%>&ftoken=<%=token%>"><font size="3" color="0000ff"><strong>Send to PublicCLoud</a></td>
	<% if(status.equals("wait"))
	{%>
	<td><font color="336600" size="3"><strong><%=status%></td>
	<%}else{%>

	<td><a href="status.jsp?sts=<%=status%>&token=<%=token%>"><font color="red" size="3"><strong><%=status%></a></td>
<%}%>
</tr>
</table>
<br><br><br><br><br><br><br>
<%@ include file="Ownerfooter.jsp"%>