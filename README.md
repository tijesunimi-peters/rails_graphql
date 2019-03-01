# XING Ruby on Rails Coding Challenge

Welcome to the XING Coding Challenge!

This challenge will give us an idea about your coding skills. You'll have access to this repository for 24 hours. Please plan around 3 hours for this challenge.

This boilerplate application has a basic Rails setup along with [graphql-ruby](https://github.com/rmosolgo/graphql-ruby) gem to handle the [GraphQL](https://graphql.org) integration.

## Installation

Just execute the usual Rails setup:

`bundle install`

And install the JavaScript packages with:

`yarn install`

## Goals

Your challenge is to provide an import mechanism for products and images which can be run at any time.

We provided some example data under `db/dataset`. You'll find a `products.csv` file and an `images` directory that contains all images for each product.
Each column in the csv file contains the name of the product, its category (type), its price and its description.
The `images` directory contains all the images for each product. The images are inside a directory with the same product name. For example given a product with name `A` you should expect to find its images under `images/A/*imageNames`.

In order to test the import, we might import a different dataset using the exact same format.

## Definition of Done:

* Set up the appropriate data model(s) from the dataset
* Create the related functionality to import all the products and the images from the dataset provided
* Create a graphql endpoint to expose the product details (product information and its related images)

## What we want to see

- Test coverage
- Comprehensive git history
- Follow best practices and provide good code readability according to the time given for the task
- Please don't use Rails `scaffold` generator
