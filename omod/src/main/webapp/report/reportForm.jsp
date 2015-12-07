<%--
 *  Copyright 2009 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Accounting module.
 *
 *  Billing module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Billing module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Billing module.  If not, see <http://www.gnu.org/licenses/>.
 *
--%>
<%@ include file="/WEB-INF/template/include.jsp"%>
<openmrs:require privilege="View Accounting Report" otherwise="/login.htm"
	redirect="/module/accounting/account.list" />

<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ include file="../includes/nav.jsp" %>




<span class="boxHeader">Monthly Payment and Commitment Report</span>
<div class="box">
<table>
<tr> <td>Select Period:</td>
	<td align="left">
	<select id="comboPeriods">
	<option>---Select Period---</option>
	<c:forEach items="${periods }" var="period">
		<option value="${period.id }">${period.name }</option>
	</c:forEach>
</select></td>
</tr>
<tr>
	<td></td>
	<td><input type="button" value="Download Payment Report" onclick="downloadPayment()"/></td>
</tr>
<tr>
	<td></td>
	<td><input type="button" value="Download Cash Report" onclick="downloadCash()"/></td>
</tr>

</table>
</div>
<script>


function downloadPayment() {
	
	var periodId = jQuery("#comboPeriods").val();
	
	var link = document.createElement('a');
	
	if (periodId) {
		link.href ="downloadPaymentReport.form?periodId="+periodId
	} else {
		link.href ="downloadPaymentReport.form"
	}
	
	link.setAttribute('download', "PaymentReport.xls");
	link.innerHTML = "Report Test";
    document.body.appendChild(link);
	link.click();
}



function downloadCash() {
	
	var periodId = jQuery("#comboPeriods").val();
	
	var link = document.createElement('a');
	
	if (periodId) {
		link.href ="downloadCashReport.form?periodId="+periodId
	} else {
		link.href ="downloadCashReport.form"
	}
	
	link.setAttribute('download', "CashReport.xls");
	link.innerHTML = "Report Test";
    document.body.appendChild(link);
	link.click();
}
</script>

<%@ include file="/WEB-INF/template/footer.jsp"%>