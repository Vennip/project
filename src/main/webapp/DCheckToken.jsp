<%@ page import="databaseconnection.*"%>

<%@ page import="java.sql.*"%>
<%
String uid=request.getParameter("uid");
String ftoken=request.getParameter("ftoken");
try{
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st1=con.createStatement();

ResultSet i1=st.executeQuery("select *from servicecloud where token='"+ftoken+"' and userid='"+uid+"'");
if(!i1.next()){

  st1.executeUpdate("update token set status='NotDuplicate' where uid='"+uid+"'");

response.sendRedirect("dTokenCheck.jsp?sentSuccessfully");
	}
	else{
		Statement st2=con.createStatement();
st2.executeUpdate("update token set status='Duplicate' where uid='"+uid+"'");

response.sendRedirect("dTokenCheck.jsp?sentSuccessfully");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>



