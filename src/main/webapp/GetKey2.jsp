<%@ include file="Ownerheader.jsp"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>

<%
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st2=con.createStatement();
String fid=request.getParameter("fid");
ResultSet i=st.executeQuery("select *from servicecloud where fid='"+fid+"'");
if(i.next())
{ 
	byte b[]=i.getBytes(4);
	String data=new String(b);
	%>
<form method="post" action="">
		
	<font size="4" color="ff9900">
	<table cellspacing=10 align="center"><tr>
<td>FileID</td><td><input type="text" name="fid" value=<%=fid%>></td></tr><tr></tr><tr></tr>
	<tr><td>FileData</td>
	<td><textarea name="file" cols="40%"rows="10%"><%=data%></textarea></td>
</tr><tr></tr><tr></tr>
<tr><td>Convergent&nbsp;Key</td><td><textarea name="ckey" cols="40%"rows="10%"><%=i.getString(5)%></textarea></td></tr><tr></tr><tr></tr>
<tr><td>PrivilegeKey</td><td><input type="text" name="pkey" value=<%=i.getString(7)%> readonly></td></tr></table>
<table align="center"><tr><td><a href="decrypt.jsp?fid=<%=fid%>"><img src="images/btn.png" width="234" height="50" border="0" alt=""></a> </td></tr>

</table>
</form><%}%><br><br><br><br></font>
<%@ include file="Ownerfooter.jsp"%>