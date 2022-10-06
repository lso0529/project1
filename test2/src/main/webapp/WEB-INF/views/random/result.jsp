<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<%@include file="../include/header.jsp"%>
      <section class="py-5 overflow-hidden bg-primary" id="home">
        <div class="container">
          <div class="row flex-center">
            <div class="col-md-5 col-lg-6 order-0 order-md-1 mt-8 mt-md-0"><a class="img-landing-banner" href="/random/doRandom"><img class="img-fluid" src="/resources/assets/img/gallery/image1.png" alt="hero-header" /></a></div>
            <div class="col-md-7 col-lg-6 py-8 text-md-start text-center">
              <h1 class="display-1 fs-md-5 fs-lg-6 fs-xl-8 text-light">랜덤 생성 결과: ${vo.fname }</h1>
              <a href="resultMap">주변 식당 보기</a>
			</div>
		</div>
		</div>
      </section>
<%@include file="../include/footer.jsp"%>