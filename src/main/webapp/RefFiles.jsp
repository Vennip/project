<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%! String token=null,status=null;%>
<%@ include file="Ownerheader.jsp"%>
<%

Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet i=st.executeQuery("select  *from reference where userid='"+(String)session.getAttribute("uid")+"'");%><br><br><table align="left"><tr><td><font color="red" size="3" ><strong><h4><i> File Downloading:</i></h4></font></td></tr></table>
<table align="center" border="4" bordercolor="3300cc" cellpadding="20" cellspacing="10">
<tr>
	<th><font color="339966" size="3" ><strong>UserID</strong></th>
	<th><font color="339966" size="3" ><strong>FileID</td>
	<th><font color="339966"size="3" ><strong>ReferenceID</td>
	<th><font color="339966"size="3" ><strong>FileName</td>
	<th><font color="339966"size="3" ><strong>Download</td>
</tr><%
while(i.next())
{
%>
<tr>
	<td><font color="003399" size="3"><strong><%=i.getString(4)%></td>
	<td><font color="003399" size="3"><strong><%=i.getString(1)%></td>
    <td><font color="003399" size="3"><strong><%=i.getString(2)%></td>
	 <td><font color="003399" size="3"><strong><%=i.getString(3)%></td>

	<td><font color="003399" size="3"><strong><a href="download1.jsp?fid=<%=i.getString(2)%>">DOWNLOAD</a></td>
</tr>

<%}%></table><br><br><br><br>
<%@ include file="Ownerfooter.jsp"%>