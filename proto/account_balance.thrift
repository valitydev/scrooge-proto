
namespace java dev.vality.scrooge.account
namespace erlang scrooge.account

include "base.thrift"

typedef base.ID ID
typedef base.Timestamp Timestamp

/** Сумма в минимальных денежных единицах. */
typedef i64 Amount

/** Баланс счета */
struct Balance {
    1: required Amount amount
    2: required string currency_code
}

struct Terminal {
    1: required ID id
    2: required string name
}

struct Provider {
    1: required ID id;
    2: required string name;
}

struct AccountBalance {
    1: required string account_id
    2: required Provider provider
    3: required Terminal terminal
    4: optional Balance balance
    5: optional Timestamp last_updated;
}

/** Ответ сервиса */
struct AccountBalanceResponse {
    1: required list<AccountBalance> balances
}

/**
* Интерфейс для работы со счетами. Используется в scrooge в качестве сервера для предоставления информации
* о счетах и терминалах.
*/
service AccountService {

    /**
     * Запрос на получение баланса терминала.
     */
    AccountBalanceResponse GetAccountBalances()

}