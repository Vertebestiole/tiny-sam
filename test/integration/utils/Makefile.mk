noinst_LIBRARIES += test/integration/utils/libTinySamIntegrationTestUtils.a

test_integration_utils_libTinySamIntegrationTestUtils_a_SOURCES = \
    test/integration/utils/TinySamIntegrationTestUtils.cpp \
    test/integration/utils/TinySamIntegrationTestUtils.h
test_integration_utils_libTinySamIntegrationTestUtils_a_CPPFLAGS = -I $(top_srcdir)/test/integration/utils/

if WINDOWS
test_integration_utils_libTinySamIntegrationTestUtils_a_SOURCES += test/integration/utils/TinySamIntegrationTestUtilsWindows.cpp
else
test_integration_utils_libTinySamIntegrationTestUtils_a_SOURCES += test/integration/utils/TinySamIntegrationTestUtilsUnix.cpp
endif