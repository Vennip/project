<%@ page import="databaseconnection.*"%>
<%@ page import="HMAC.*"%>
<%@ page import="java.sql.*"%>
<%
String uid=request.getParameter("uid");
String ftag=request.getParameter("ftag");
System.out.println("t1="+ftag);
try{
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet i=st.executeQuery("select userid,passwrd,eid from signup where userid='"+uid+"'");
if(i.next())
	{session.setAttribute("uid",uid);
String pkey=i.getString(1)+i.getString(2)+i.getString(3);
//String token=i.getString(1)+i.getString(2)+i.getString(3)+ftag;
//System.out.println("t="+token);
 String privilege=HMAC.SHA_1(pkey,"SHA-1"); 
//out.println("k="+token);
Statement s=con.createStatement();
ResultSet rs=s.executeQuery("select *from treq");
String token=null;
if(rs.next())
		{
token=rs.getString(2)+privilege;
		}
Statement st1=con.createStatement();
Statement st2=con.createStatement();
Statement st3=con.createStatement();
st3.executeUpdate("update signup set pkey='"+privilege+"' where userid='"+uid+"'");
int i1=st1.executeUpdate("insert into token values('"+uid+"','"+token+"','"+privilege+"','wait')");
 st2.executeUpdate("delete from treq where uid='"+uid+"'");
if(i1>0){
response.sendRedirect("tokenReq.jsp?sentSuccessfully");
	}
}}
catch(Exception e)
{
	e.printStackTrace();
}
%>



