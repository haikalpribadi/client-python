#
# GRAKN.AI - THE KNOWLEDGE GRAPH
# Copyright (C) 2018 Grakn Labs Ltd
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#


exports_files(["requirements.txt"])

load("@io_bazel_rules_python//python:python.bzl", "py_library", "py_test")
load("@pypi_dependencies//:requirements.bzl", "requirement")
load("@pypi_deployment_dependencies//:requirements.bzl", deployment_requirement = "requirement")
load("@graknlabs_bazel_distribution//pip:rules.bzl", "deploy_pip")


py_library(
    name = "client_python",
    srcs = [
        "//grakn:__init__.py",
        "//grakn:service/Keyspace/KeyspaceService.py",
        "//grakn:service/Session/TransactionService.py",
        "//grakn:service/Session/util/enums.py",
        "//grakn:service/Session/util/RequestBuilder.py",
        "//grakn:service/Session/util/ResponseReader.py",
        "//grakn:service/Session/Concept/ConceptFactory.py",
        "//grakn:service/Session/Concept/BaseTypeMapping.py",
        "//grakn:service/Session/Concept/Concept.py",
        "//grakn:exception/GraknError.py",
    ],
    deps = [
        "//grakn:protocol_python",
        requirement("protobuf"),
        requirement("grpcio"),
        requirement("six"),
        requirement("enum34"),
    ]
)

deploy_pip(
    name = "deploy-pip",
    package_name = "grakn",
    version_file = "//:VERSION",
    classifiers = [
        "Programming Language :: Python",
        "Programming Language :: Python :: 2",
        "Programming Language :: Python :: 2.7",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.4",
        "Programming Language :: Python :: 3.5",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
        "Intended Audience :: Developers",
        "Intended Audience :: Science/Research",
        "Environment :: Console",
        "Topic :: Database :: Front-Ends"
    ],
    url = "https://github.com/graknlabs/grakn/tree/master/client-python",
    author = "Grakn Labs",
    author_email = "community@grakn.ai",
    license = "Apache-2.0",
    install_requires=['grpcio==1.16.0', 'protobuf==3.6.1', 'six==1.11.0', 'enum34==1.1.6'],
    keywords = ["grakn", "database", "graph", "knowledgebase", "knowledge-engineering"],
    deployment_properties = "//:deployment.properties",
    description = "A Python client for Grakn.",
    long_description_file = "//client_python:README.md",
    deps = [
        deployment_requirement("twine"),
        deployment_requirement("setuptools"),
        deployment_requirement("wheel"),
        deployment_requirement("requests"),
        deployment_requirement("urllib3"),
        deployment_requirement("chardet"),
        deployment_requirement("certifi"),
        deployment_requirement("idna"),
        deployment_requirement("tqdm"),
        deployment_requirement("requests_toolbelt"),
        deployment_requirement("pkginfo"),
        deployment_requirement("readme_renderer"),
        deployment_requirement("Pygments"),
        deployment_requirement("docutils"),
        deployment_requirement("bleach"),
        deployment_requirement("webencodings")
    ],
    target = ":client_python"
)


py_test(
    name = "test_concept",
    srcs = [
        "tests/integration/base.py",
        "tests/integration/test_concept.py"
    ],
    deps = [
        ":client_python",
        requirement("forbiddenfruit")
    ],
    imports = ["."]
)

py_test(
    name = "test_grakn",
    srcs = [
        "tests/integration/base.py",
        "tests/integration/test_grakn.py"
    ],
    deps = [
        ":client_python",
        requirement("forbiddenfruit")
    ],
    imports = ["."]
)

py_test(
    name = "test_keyspace",
    srcs = [
        "tests/integration/base.py",
        "tests/integration/test_keyspace.py"
    ],
    deps = [
        ":client_python",
        requirement("forbiddenfruit")
    ],
    imports = ["."]
)

test_suite(
    name = "test_integration",
    tests = [
        ":test_concept",
        ":test_grakn",
        ":test_keyspace"
    ]
)
