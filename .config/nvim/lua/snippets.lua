
snippet pytest_async_test "Create an async pytest test function" b
@pytest.mark.asyncio()
async def test_${1:give_no_orders_should_return_empty_list}() -> None:
    """$2"""
    # Act
    async with AsyncClient(app=app, base_url='http://test') as client:
        response = await client.get(
            f'{URL}/${3:orders}',
        )

    # Assert
    assert response.json().get('${4:orders}') == ${5:[]}
    assert response.status_code == status.HTTP_200_OK
    assert response.request.method == '${6:GET}'
endsnippet
