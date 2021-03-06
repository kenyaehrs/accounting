<%--
 *  Copyright 2009 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Accounting module.
 *
 *  Accounting module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Accounting module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Billing module.  If not, see <http://www.gnu.org/licenses/>.
 *
--%>

<%@ include file="/WEB-INF/template/include.jsp"%>

<openmrs:require privilege="View BankStatement" otherwise="/login.htm"
	redirect="/module/account/main.form" />

<spring:message var="pageTitle" code="accounting.bankStatement.manage"
	scope="page" />

<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ include file="../includes/nav.jsp" %>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/moduleResources/account/styles/paging.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/moduleResources/account/scripts/paging.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/moduleResources/account/scripts/jquery/jquery-1.4.2.min.js"></script>

<p>
<b><a href="bankStatement.list">List Bank Statement</a></b>&nbsp; | &nbsp;
<b><a href="bankStatement.form">Add Bank Statement</a></b>&nbsp; | &nbsp;
<b><a href="bankAccount.list">List Bank Account</a></b>&nbsp; | &nbsp;
<b><a href="bankAccount.form">Add Bank Account</a></b>
</p>

<h2>
	<spring:message code="accounting.bankStatement.manage" />
</h2>
<br />
<c:forEach items="${errors.allErrors}" var="error">
	<span class="error"><spring:message
			code="${error.defaultMessage}" text="${error.defaultMessage}" />
	</span><
</c:forEach>
<input type="button"
	value="<spring:message code='accounting.bankStatement.add'/>"
	onclick="javascript:window.location.href='bankStatement.form'" />

<br />
<br />
<c:choose>
	<c:when test="${not empty listStatements}">
		<form method="post" onsubmit="return false" id="form">
			<span class="boxHeader"><spring:message
					code="accounting.bankStatement.list" />
			</span>
			<div class="box">
				<table cellpadding="5" cellspacing="0">
					<tr>
						<th>S.No</th>
						<th><spring:message code="accounting.dateFrom" />
						</th>
							<th><spring:message code="accounting.dateTo" />
						</th>
						<th><spring:message code="accounting.amount" />
						</th>
						<th><spring:message code="accounting.bankstatement.type" />
						</th>
						<th><spring:message code="accounting.receiptType" />
						</th>
						<th><spring:message code="accounting.description" />
						</th>
						<th></th>
					</tr>
					<c:forEach items="${listStatements}" var="statement"
						varStatus="varStatus">
						<tr class='${varStatus.index % 2 == 0 ? "oddRow" : "evenRow" } ' <c:if test="${statement.voided}"> style="text-decoration:line-through;"</c:if>>
							<td><c:out
									value="${(( pagingUtil.currentPage - 1  ) * pagingUtil.pageSize ) + varStatus.count }" />
							</td>
							<td><a
								href="javascript:window.location.href='bankStatement.form?id=${statement.id}'"><openmrs:formatDate date="${statement.dateFrom}"
									type="textbox" /></a>
							</td>
							<td><openmrs:formatDate date="${statement.dateTo}"
									type="textbox" /></a>
							</td>
							<td align="right">${statement.amount}</td>
							<td align="left">${statement.type}</td>
							<td align="left">${statement.receiptType}</td>
							<td>${statement.description}</td>
							<td></td>
						</tr>
					</c:forEach>
					</form>
					<tr class="paging-container">
						<td colspan="7"><%@ include file="../paging.jsp"%></td>
					</tr>
				</table>
			</div>
	</c:when>
	<c:otherwise>
No Bank Statement found.
</c:otherwise>
</c:choose>

<%@ include file="/WEB-INF/template/footer.jsp"%>
