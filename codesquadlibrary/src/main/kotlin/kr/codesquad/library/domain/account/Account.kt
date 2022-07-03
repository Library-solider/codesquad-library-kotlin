package kr.codesquad.library.domain.account

import javax.persistence.*

@Entity
class Account(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "account_id")
    var id: Long? = null,

    var oauthId: String,
    var name: String? = null,
    var email: String,
    var avatarUrl: String? = null,

    @Enumerated(EnumType.STRING)
    var libraryRole: LibraryRole
) {

}
