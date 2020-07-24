document.addEventListener("DOMContentLoaded", function(){
	const dropdownElements = document.querySelectorAll("[data-dropdown-parent]");
	let dropdownObject = [];
	let dropdownEl;
	
	function setDropdownObject() {
	    for (let i = 0; i < dropdownElements.length; i++) {
	        dropdownEl = dropdownElements[i];
	        dropdownObject = [
	            ...dropdownObject,
	            {
	                key: i,
	                parent: dropdownEl,
	                target: dropdownEl.querySelector("[data-dropdown-target]"),
	                box: dropdownEl.querySelector("[data-dropdown-box]"),
	            }
	        ]
	    }
	}
	
	function dropdownFunc() {
	    for (let i = 0; i < dropdownObject.length; i++) {
	        dropdownObject[i].target.addEventListener("mouseover", function(){
	            dropdownObject[i].parent.classList.add("on");
	            dropdownObject[i].box.style.visibility = "visible";
	            dropdownObject[i].box.style.opacity = 1;
	        });
	
	        dropdownObject[i].parent.addEventListener('mouseleave', function(){
	            this.classList.remove('on');
	            dropdownObject[i].box.style.visibility = "hidden";
	            dropdownObject[i].box.style.opacity = 0;
	        });
	    }
	}
	
	function dropdowninit() {
	    setDropdownObject();
	    dropdownFunc();
	    console.log(dropdownObject);
	}
	
	
	dropdowninit(); 
});