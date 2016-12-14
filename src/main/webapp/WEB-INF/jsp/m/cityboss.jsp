<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <title>牛家帮今日数据概要</title>
    <meta charset="en">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="description" content="牛家帮、家政服务、家政、出行、洗衣、跑腿">
    <link rel="stylesheet" href="static/jquery_weui/dist/lib/weui.min.css">
    <link rel="stylesheet" href="static/jquery_weui/dist/css/jquery-weui.css">
    <link rel="stylesheet" href="static/jquery_weui/dist/demos/css/demos.css">
</head>

<body ontouchstart>

<div class="container" id="container">
    <div class="weui_cells_title">充值金额(单位:元)  </div>
    <div class="weui_cells">
        <c:choose>
            <c:when test="${not empty varlist}">
                <c:forEach items="${varlist}" var="var" varStatus="vs">
                    <%--上海--%>
                    <c:if test="${pd.type == 1 && vs.index+1 == 1}">
                        <div class="weui_cell">
                            <div class="weui_cell_hd"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII=" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary">
                                <p>${var.cityname}</p>
                            </div>
                            <div class="weui_cell_ft">${var.money}</div>
                        </div>
                    </c:if>
                    <%--深圳--%>
                    <c:if test="${pd.type == 2 && vs.index+1 == 2}">
                        <div class="weui_cell">
                            <div class="weui_cell_hd"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII=" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary">
                                <p>${var.cityname}</p>
                            </div>
                            <div class="weui_cell_ft">${var.money}</div>
                        </div>
                    </c:if>

                    <%--杭州--%>
                    <c:if test="${pd.type == 3 && vs.index+1 == 3}">
                        <div class="weui_cell">
                            <div class="weui_cell_hd"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII=" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary">
                                <p>${var.cityname}</p>
                            </div>
                            <div class="weui_cell_ft">${var.money}</div>
                        </div>
                    </c:if>

                    <%--全部--%>
                    <c:if test="${pd.type == 0}">
                        <div class="weui_cell">
                            <div class="weui_cell_hd"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII=" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary">
                                <p>${var.cityname}</p>
                            </div>
                            <div class="weui_cell_ft">${var.money}</div>
                        </div>
                    </c:if>


                </c:forEach>

                <c:if test="${pd.type == 0}">
                    <div class="weui_cell">
                        <div class="weui_cell_ft">总计:&nbsp;${pd.totalMoney}</div>
                    </div>
                </c:if>

            </c:when>
        </c:choose>
    </div>


    <div class="weui_cells_title">服务订单(单位:单)</div>
    <div class="weui_cells">
        <c:choose>
            <c:when test="${not empty varlist}">
                <c:forEach items="${varlist}" var="var" varStatus="vs">

                    <%--上海--%>
                    <c:if test="${pd.type == 1 && vs.index+1 == 1}">
                        <div class="weui_cell">
                            <div class="weui_cell_hd">
                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII=" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary">
                                <p>${var.cityname}</p>
                            </div>
                            <div class="weui_cell_ft">家政:${var.a753737} ; 跑腿:${var.a1158606} ; 出行:${var.a817011} ;洗衣${var.a900652}</div>
                        </div>
                    </c:if>

                    <%--深圳--%>
                    <c:if test="${pd.type == 2 && vs.index+1 == 2}">
                        <div class="weui_cell">
                            <div class="weui_cell_hd">
                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII=" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary">
                                <p>${var.cityname}</p>
                            </div>
                            <div class="weui_cell_ft">家政:${var.a753737} ; 跑腿:${var.a1158606} ; 出行:${var.a817011} ;洗衣${var.a900652}</div>
                        </div>
                    </c:if>

                    <%--杭州--%>
                    <c:if test="${pd.type == 3 && vs.index+1 == 3}">
                        <div class="weui_cell">
                            <div class="weui_cell_hd">
                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII=" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary">
                                <p>${var.cityname}</p>
                            </div>
                            <div class="weui_cell_ft">家政:${var.a753737} ; 跑腿:${var.a1158606} ; 出行:${var.a817011} ;洗衣${var.a900652}</div>
                        </div>
                    </c:if>

                    <%--全部--%>
                    <c:if test="${pd.type == 0}">
                        <div class="weui_cell">
                            <div class="weui_cell_hd">
                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII=" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary">
                                <p>${var.cityname}</p>
                            </div>
                            <div class="weui_cell_ft">家政:${var.a753737} ; 跑腿:${var.a1158606} ; 出行:${var.a817011} ;洗衣${var.a900652}</div>
                        </div>
                    </c:if>
                </c:forEach>
                <c:if test="${pd.type == 0}">
                    <div class="weui_cell">
                        <div class="weui_cell_ft">总计:家政:${pd.jzcount} ; 跑腿:${pd.ptcount} ; 出行:${pd.dccount} ; 洗衣${pd.xycount}</div>
                    </div>
                </c:if>
            </c:when>
        </c:choose>
</div>
    <div class="weui_cells_title">满意度比 &nbsp;&nbsp;&nbsp;&nbsp;<font color="red"><c:if test="${pd.type == 0 }">日满意度:${pd.totalmyd}%</font></c:if></div>
    <div class="weui_cells">
        <c:choose>
            <c:when test="${not empty varlist}">
                <c:forEach items="${varlist}" var="var" varStatus="vs">
                    <c:if test="${pd.type == 1 && vs.index+1==1 }">
                        <div class="weui_cell">
                            <div class="weui_cell_hd"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII=" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary">
                                <p>${var.cityname}</p>
                            </div>
                            <div class="weui_cell_ft">
                                    评价总数:${var.allmyd20091637}&nbsp;|&nbsp;满意评价:${var.myd20091637}
                            </div>
                        </div>
                    </c:if>


                    <c:if test="${pd.type == 2 && vs.index+1==2 }">
                        <div class="weui_cell">
                            <div class="weui_cell_hd"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII=" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary">
                                <p>${var.cityname}</p>
                            </div>
                            <div class="weui_cell_ft">
                                    评价总数:${var.allmyd27763424}&nbsp;|&nbsp;满意评价:${var.myd27763424}
                             </div>
                        </div>
                    </c:if>


                    <c:if test="${pd.type == 3 && vs.index+1==3 }">
                        <div class="weui_cell">
                            <div class="weui_cell_hd"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII=" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary">
                                <p>${var.cityname}</p>
                            </div>
                            <div class="weui_cell_ft">
                                    评价总数:${var.allmyd26213393}&nbsp;|&nbsp;满意评价:${var.myd26213393}
                            </div>
                        </div>
                    </c:if>


                    <c:if test="${pd.type == 0}">
                        <div class="weui_cell">
                            <div class="weui_cell_hd"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII=" alt="" style="width:20px;margin-right:5px;display:block"></div>
                            <div class="weui_cell_bd weui_cell_primary">
                                <p>${var.cityname}</p>
                            </div>
                            <div class="weui_cell_ft">
                                <c:if test="${vs.index ==0}">
                                    评价总数:${var.allmyd20091637}&nbsp;|&nbsp;满意评价:${var.myd20091637}
                                </c:if>
                                <c:if test="${vs.index ==1}">
                                    评价总数:${var.allmyd27763424}&nbsp;|&nbsp;满意评价:${var.myd27763424}
                                </c:if>
                                <c:if test="${vs.index ==2}">
                                    评价总数:${var.allmyd26213393}&nbsp;|&nbsp;满意评价:${var.myd26213393}
                                </c:if> </div>
                        </div>
                    </c:if>
                </c:forEach>

                <c:if test="${pd.type == 0}">
                <div class="weui_cell">
                    <div class="weui_cell_ft">&nbsp;上海管家技师:${pd.shJsCount}&nbsp;|&nbsp;深圳管家技师:${pd.szJsCount}&nbsp;|&nbsp;杭州管家技师:${pd.hzJsCount}</div>
                </div>
                </c:if>
                <c:if test="${pd.type == 1}">
                    <div class="weui_cell">
                        <div class="weui_cell_ft">上海管家技师:${pd.shJsCount}</div>
                    </div>
                </c:if>
                <c:if test="${pd.type == 2}">
                    <div class="weui_cell">
                        <div class="weui_cell_ft">深圳管家技师:${pd.szJsCount}</div>
                    </div>
                </c:if>
                <c:if test="${pd.type == 3}">
                    <div class="weui_cell">
                        <div class="weui_cell_ft">杭州管家技师:${pd.hzJsCount}</div>
                    </div>
                </c:if>
            </c:when>
        </c:choose>
    </div>
    </div>


</div>
<script src="static/jquery_weui/dist/lib/jquery-2.1.4.js"></script>
<script src="static/jquery_weui/dist/js/jquery-weui.js"></script>
<script>
    $("#date").calendar();
    $("#date").bind('change',function(){
        var datenow = $("#date").val();
        alert(datenow);
    });
</script>
</body>
</html>
