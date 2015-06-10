Template1 = ->
	template: '
		h3 DCS Undergraduate Project Portal
		hr

		p 
			|The DCS Undergraduate Project Portal is a Student-Research Project matching program developed by students from the Department of Computer Science at the University of Toronto. 

		p
			|DCSUPP allows students to view and apply to projects. It also allows researchers and professors to post projects. DCSUPP also includes project applications and project to student matching. Our site reuses application information as much as possible to user experience.

		p
			|Contact alan[dot]yuan@mail[dot]utoronto[dot].ca for more information
		hr

		button class="btn btn-default" type="submit" 
			|Newer 
			span aria-hidden="true" &rarr;'



angular
	.module("dcsupp", [])
	.directive("Intro_page1", Template1)