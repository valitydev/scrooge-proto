
namespace java dev.vality.account_balance
namespace erlang account_balance

typedef map<string, string> StringMap

/**
 * Отметка во времени согласно RFC 3339.
 *
 * Строка должна содержать дату и время в UTC в следующем формате:
 * `2016-03-22T06:12:27Z`.
 */
typedef string Timestamp

/** Сумма в минимальных денежных единицах. */
typedef i64 Amount

/** Номер счёта. */
typedef i64 AccountID

struct BalanceRequest {
 1: required StringMap options
 2: optional Timestamp requestTime
}

/** Баланс счета */
struct Balance {
    1: required Amount amount
    2: required string currency_code
}

/** Счет провайдера */
struct Account {
  1: required AccountID id
}

struct BalanceResponse {
 1: required Balance balance
 2: required Account account
 3: optional Timestamp responseTime
}

/**
* Интерфейс для работы со счетами провайдеров
*/
service AccountService {

    /**
     * Запрос на получение баланса счета провайдера.
     */
    BalanceResponse GetBalance (1: BalanceRequest)

}
