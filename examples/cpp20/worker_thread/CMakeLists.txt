add_executable(${PROJECT_NAME}-worker-thread
	"main.cpp"
	"pch.h"
	"pch.cpp"
    "worker_thread.h"
    "worker_thread.cpp"
)

target_precompile_headers(${PROJECT_NAME}-worker-thread
	PRIVATE
		"pch.h"
)

target_compile_options(${PROJECT_NAME}-worker-thread
	PRIVATE 
		${COMPILER_WARNINGS}
		$<$<CONFIG:Debug>:${COMPILER_DEBUG_OPTIMISATION}>
		$<$<CONFIG:Release>:${COMPILER_RELEASE_OPTIMISATION}>
)