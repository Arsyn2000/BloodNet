package com.taim.conduire.dto;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

public class CustomerDTO {
    @NotNull
    @Valid
    private CustomerAccountDTO account;

    public CustomerDTO() {
    }

    public CustomerDTO(final CustomerAccountDTO account) {
        this.account = account;
    }

    public CustomerAccountDTO getAccount() {
        return account;
    }

    public void setAccount(final CustomerAccountDTO account) {
        this.account = account;
    }

}
