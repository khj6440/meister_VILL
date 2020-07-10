<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Meister Center</title>
    <link rel="stylesheet" href="/resources/yr/css/meisterList_css.css" type="text/css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <div class="content-box-yr">
        <div class="page-title">
            마이스터 센터
        </div>
        <div class="content-box">
            <div class="search-line">
                <div class="keyword-search">
                    <span class="hdsc-icon"><a href="#"><i class="fa fa-search"></i></a></span>
                    <input type="text" name="keyword" class="form-control form-control-sm" placeholder="Search...">
                </div>
                <div class="lg-range">
                    <select name="category1">
                        <option value="iTP">IT/Programming</option>
                        <option value="design">Design</option>
                    </select>
                </div>
                <div class="sm-range">
                    <select name="category2">
                        <option value="00">00</option>
                        <option value="01">01</option>
                        <option value="02">02</option>
                        <option value="03">03</option>
                    </select>
                </div>
            </div>
            <div class="search-range">
                <select name="mcrange">
                    <option value="review">후기순</option>
                    <option value="star">별점순</option>
                    <option value="recent">최근 활동순</option>
                </select>
            </div>
            <div class="meisters-box">
                <table>
                    <tr>
                        <td>
                            <div class="m-profile">
                                <img src="/resources/yr/imgs/profile_img2.png" width="100px">
                            </div>
                            <div class="m-info">
                                <div class="m-name">000</div>
                                <div class="m-introduce">자기소개~ 설명~</div>
                                <div class="m-star">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">
                                    <img src="/resources/yr/imgs/star_full.png" width="2%">

                                </div>
                                <div class="m-review">
                                    <div class="mre-icon">
                                        <img src="/resources/yr/imgs/review.png" width="25px;">
                                    </div>
                                    <div class="mre-writer">000</div>
                                    <div class="mre-review">후기 내용~~~</div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="m-btn-more">
                <button type="button" class="btn btn-yr-normal-gray" id="btn-more">더보기</button>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    
</body>

</html>
