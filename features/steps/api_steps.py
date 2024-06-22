from behave import *
import requests
from requests import codes as status_codes
from scripts import randomizer


@when(u'The user posts to the signup api endpoint with a valid new username and password')
def step_impl(context):
    # Generate new username and password
    new_username = new_password = randomizer.append_random_hash(context.test_user)

    # Post credentials to endpoint and await response.
    context.response = add_user(context, new_username, new_password)


@then(u'The resulting status code should be "{expected_status_code}"')
def step_impl(context, expected_status_code):
    # Check the response code
    assert status_codes[expected_status_code] == context.response.status_code
    assert status_codes[expected_status_code] == context.response.status_code


@given(u'username:"{username}" with password:"{password}"')
def step_impl(context, username, password):
    if "errorMessage" in login(context, username, password).json():
        add_user(context, username, password)


@when(u'The user posts to the signup api endpoint with existing "{username}" and "{password}"')
def step_impl(context, username, password):
    context.response = add_user(context,
                                username,
                                password)


@when('The user posts to the login api endpoint with "{username}" and "{password}"')
def step_impl(context, username, password):
    context.response = login(context, username, password)


@step(u'The response body should contain "{field}" with "{value}"')
def step_impl(context, field, value):
    response_data = context.response.json()
    assert response_data is not None

    assert_field_and_value(response_data, field, value)


def login(context, username, password):
    return requests.post(
        context.api_url + context.login_endpoint,
        json={
            'username': username,
            'password': password
        }
    )


def add_user(context, username, password):
    return requests.post(
        context.api_url + context.signup_endpoint,
        json={
            'username': username,
            'password': password
        }
    )


def assert_field_and_value(data, field, value):
    assert field in data
    assert data[field] == value
