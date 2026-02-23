add_executable(${PROJECT_NAME}-app
	"main.cpp"
	"pch.h"
	"pch.cpp"
)

target_compile_options(${PROJECT_NAME}-app
	PRIVATE 
		${COMPILER_WARNINGS}
		$<$<CONFIG:Debug>:${COMPILER_DEBUG_OPTIMISATION}>
		$<$<CONFIG:Release>:${COMPILER_RELEASE_OPTIMISATION}>
)

target_precompile_headers(${PROJECT_NAME}-app
	PRIVATE
		"pch.h"
)

target_compile_definitions(${PROJECT_NAME}-app
	PRIVATE
		PROJECT_VERSION="${PROJECT_VERSION}"		
)