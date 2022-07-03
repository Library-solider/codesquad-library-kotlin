package kr.codesquad.library.domain.account

enum class LibraryRole(val key: String) {
    GUEST("ROLE_GUEST"),
    USER("ROLE_USER"),
    ADMIN("ROLE_ADMIN")
}
