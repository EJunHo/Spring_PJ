/**
 * new > other > javascript fild
	toggleButton(햄버거 버튼)을 클릭했을때 menu와 icon의 클래스가 active 없다면 추가 있다면 제거
	 javascript 추가 햄버거버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 MAIN.JS에서 추가
 */
const toggleBtn = document.querySelector('.navbar_toggleBtn');
const menu = document.querySelector('.navbar_menu');
const icons = document.querySelector('.navbar_icons');

/*addEventListener API를 통해 클릭이 될때마다 지정한 함수 호출*/

toggleBtn.addEventListener('click', ()=> {
	menu.classList.toggle('active');
	icons.classList.toggle('active');
});

