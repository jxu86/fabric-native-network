package main

import (
	"errors"
	"fmt"

	"github.com/hyperledger/fabric-contract-api-go/contractapi"
)

type SimpleContract struct {
	contractapi.Contract
}

//上链
func (sc *SimpleContract) Create(ctx contractapi.TransactionContextInterface, key string, value string) error {
	existing, err := ctx.GetStub().GetState(key)
	if err != nil {
		return errors.New("查询失败！")
	}
	if existing != nil {
		return fmt.Errorf("添加数据错误！%s已经存在。", key)
	}
	err = ctx.GetStub().PutState(key, []byte(value))
	if err != nil {
		return errors.New("添加数据失败！")
	}
	return nil
}

//更新
func (sc *SimpleContract) Update(ctx contractapi.TransactionContextInterface, key string, value string) error {
	bytes, err := ctx.GetStub().GetState(key)
	if err != nil {
		return errors.New("查询失败！")
	}
	if bytes == nil {
		return fmt.Errorf("没有查询到%s对应的数据", key)
	}
	err = ctx.GetStub().PutState(key, []byte(value))
	if err != nil {
		return errors.New("更新失败：" + err.Error())
	}
	return nil
}

//查询
func (sc *SimpleContract) Read(ctx contractapi.TransactionContextInterface, key string) (string, error) {
	bytes, err := ctx.GetStub().GetState(key)
	if err != nil {
		return "", errors.New("查询失败！")
	}
	if bytes == nil {
		return "", fmt.Errorf("数据不存在，读到的%s对应的数据为空！", key)
	}
	return string(bytes), nil
}
func main() {
	fmt.Println("main start...")
	contract := new(SimpleContract)
	cc, err := contractapi.NewChaincode(contract)
	if err != nil {
		panic("创建智能合约失败1：" + err.Error())
	}
	if err := cc.Start(); err != nil {
		panic("启动智能合约失败2：" + err.Error())
	}

}
