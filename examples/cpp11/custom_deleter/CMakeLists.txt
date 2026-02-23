find_package(PkgConfig REQUIRED)
pkg_check_modules(MODBUS REQUIRED libmodbus)

add_executable(${PROJECT_NAME}-custom-deleter
	"main.cpp"
	"pch.h"
	"pch.cpp"
)

target_include_directories(${PROJECT_NAME}-custom-deleter
	PRIVATE 
		${MODBUS_INCLUDE_DIRS}
)

target_link_libraries(${PROJECT_NAME}-custom-deleter
	PRIVATE 
		${MODBUS_LIBRARIES}
)

target_precompile_headers(${PROJECT_NAME}-custom-deleter
	PRIVATE
		"pch.h"
)

target_compile_options(${PROJECT_NAME}-custom-deleter
	PRIVATE 
		${COMPILER_WARNINGS}
		$<$<CONFIG:Debug>:${COMPILER_DEBUG_OPTIMISATION}>
		$<$<CONFIG:Release>:${COMPILER_RELEASE_OPTIMISATION}>
)