<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- action='#' 表示提交数据到本页 --%>
<form id="mainForm" action="#" method="post" />
<input type="hidden" id="pageNo" name="pageNo" />
<input type="hidden" id="orderBy" name="orderBy" />
<input type="hidden" id="order" name="order" />
<div class="btn-group" role="group" aria-label="...">
	<c:if test="${page.totalPages > 1 && page.pageNo != 1}">
		<button class="btn btn-default" onclick="jumpPage(1)">首页</button>
	</c:if>
	<c:if test="${page.hasPre}">
	    <button class="btn btn-default" onclick="jumpPage(${page.pageNo - 1})">上一页</button>
	</c:if>
	<c:if test="${page.totalPages > 1}">
		<c:choose>
			<c:when test="${page.pageNo - 5 < 0}">
				<c:forEach var="i" begin="1" end="${page.totalPages > 10 ? 10 : page.totalPages}">
					<c:choose>
						<c:when test="${i == page.pageNo}">
							<button class="btn btn-primary">${i}</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-default" onclick="jumpPage(${i})">${i}</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:when>
			<c:when test="${page.pageNo - 5 >= 0 && (page.pageNo + 5) <= page.totalPages}">
				<c:forEach var="i" begin="${page.pageNo > 5 ? (page.pageNo - 5) : 1}" 
				    end="${page.totalPages > (page.pageNo - 5 + 9) ? (page.pageNo - 5 + 9) : page.totalPages}">
					<c:choose>
						<c:when test="${i == page.pageNo}">
							<button class="btn btn-primary">${i}</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-default" onclick="jumpPage(${i})">${i}</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:when>
			<c:when test="${page.pageNo + 5 > page.totalPages && page.pageNo - 5 >= 0}">
				<c:forEach var="i" begin="${(page.pageNo - 9) > 0 ? page.pageNo - 9 : i + 1}" end="${page.totalPages}">
					<c:choose>
						<c:when test="${i == page.pageNo}">
							<button class="btn btn-primary">${i}</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-default" onclick="jumpPage(${i})">${i}</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:when>
		</c:choose>
	</c:if>
	<c:if test="${page.hasNext}">
	    <button class="btn btn-default" onclick="jumpPage(${page.pageNo + 1})">下一页</button>
	</c:if>
	<c:if test="${page.totalPages > 1 && page.pageNo != page.totalPages}">
	    <button class="btn btn-default" onclick="jumpPage(${page.totalPages})">尾页</button>
	</c:if>

	<c:if test="${page.totalPages > 8}">
		<div class="input-group">
	      <input id="gopage" name="gopage" class="form-control" style="width:25px;" value="${page.pageNo}"
	           type="number" min="1" max="${page.totalPages}"/>
	      <span class="input-group-btn">
	        <button class="btn btn-default" onclick="jumpPage($('#gopage').val())">跳转</button>
	      </span>
	    </div>
	</c:if>

</div>
