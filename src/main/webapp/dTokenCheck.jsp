
<%@ include file="Publicheader.jsp"%>
<marquee behavior="alternate" direction="left">

<!-- Marquee Side Touch Margin Bounce Text by Way2Tutorial.com -->
<font color="blue"  name="TimesnewRoman"><STRONG><i> WELCOME TO&nbsp;PUBLIC&nbsp;CLOUD</i></STRONG></font></marquee>
<center>

<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%

Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet i=st.executeQuery("select *from duplcheck");%><br><br>
<table align="center" border="4" bordercolor="808000" cellpadding="20" cellspacing="10">
<tr>
	<th><font color="003399" size="3" ><strong>UserID</strong></th>
	<th><font color="003399" size="3" ><strong>FileToken</td>
	<th><font color="003399"size="3" ><strong>Action</td>
	
</tr>

<% while(i.next())
	{%>
<tr>
	<td><font color="660033" size="3"><strong><%=i.getString(1)%></td>
	<td><font color="660033" size="3"><strong><%=i.getString(2)%></td>
    <td><font color="660033" size="3"><strong><a href="DCheckToken.jsp?uid=<%=i.getString(1)%>&ftoken=<%=i.getString(2)%>">Verify & Send</a></td>

</tr><%}%>
</table><br><br><br><br><br>

<%@ include file="Ownerfooter.jsp"%>