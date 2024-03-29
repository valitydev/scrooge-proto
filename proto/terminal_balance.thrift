
namespace java dev.vality.scrooge.terminal.balance
namespace erlang scrooge.terminal.balance

include "base.thrift"

typedef base.ID ID
typedef base.Timestamp Timestamp

/** Сумма в минимальных денежных единицах. */
typedef string Amount

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

struct TerminalBalance {
    1: required string account_id
    2: required Provider provider
    3: required Terminal terminal
    4: required Balance balance
    5: required Timestamp last_updated;
}

/** Ответ сервиса */
struct TerminalBalanceResponse {
    1: required list<TerminalBalance> balances
}

/**
* Интерфейс для работы со счетами провайдеров. Используется в scrooge в качестве сервера для предоставления информации
* о терминалах.
*/
service TerminalService {

    /**
     * Запрос на получение баланса терминала.
     */
    TerminalBalanceResponse GetTerminalBalances()

}