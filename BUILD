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

exports_files(["requirements.txt", "deployment.properties", "RELEASE_TEMPLATE.md"])

load("@io_bazel_rules_python//python:python.bzl", "py_library", "py_test")

load("@graknlabs_client_python_pip//:requirements.bzl",
       graknlabs_client_python_requirement = "requirement")

load("@graknlabs_bazel_distribution//pip:rules.bzl", "deploy_pip")
load("@graknlabs_bazel_distribution_pip//:requirements.bzl",
       graknlabs_bazel_distribution_requirement = "requirement")

load("@graknlabs_bazel_distribution//github:rules.bzl", "deploy_github")


py_library(
    name = "client_python",
    srcs = glob(["grakn/**/*.py"]),
    deps = [
        "@graknlabs_protocol//keyspace:python",
        "@graknlabs_protocol//session:python",
        graknlabs_client_python_requirement("protobuf"),
        graknlabs_client_python_requirement("grpcio"),
        graknlabs_client_python_requirement("six"),
        graknlabs_client_python_requirement("enum_compat"),
    ],
    visibility =["//visibility:public"]
)

deploy_pip(
    name = "deploy-pip",
    package_name = "grakn-client",
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
    install_requires=['grpcio==1.16.0', 'protobuf==3.6.1', 'six==1.11.0', 'enum-compat==0.0.2'],
    keywords = ["grakn", "database", "graph", "knowledgebase", "knowledge-engineering"],
    deployment_properties = "@graknlabs_build_tools//:deployment.properties",
    description = "Grakn Client for Python",
    long_description_file = "//:README.md",
    deps = [
        graknlabs_bazel_distribution_requirement("twine"),
        graknlabs_bazel_distribution_requirement("setuptools"),
        graknlabs_bazel_distribution_requirement("wheel"),
        graknlabs_bazel_distribution_requirement("requests"),
        graknlabs_bazel_distribution_requirement("urllib3"),
        graknlabs_bazel_distribution_requirement("chardet"),
        graknlabs_bazel_distribution_requirement("certifi"),
        graknlabs_bazel_distribution_requirement("idna"),
        graknlabs_bazel_distribution_requirement("tqdm"),
        graknlabs_bazel_distribution_requirement("requests_toolbelt"),
        graknlabs_bazel_distribution_requirement("pkginfo"),
        graknlabs_bazel_distribution_requirement("readme_renderer"),
        graknlabs_bazel_distribution_requirement("Pygments"),
        graknlabs_bazel_distribution_requirement("docutils"),
        graknlabs_bazel_distribution_requirement("bleach"),
        graknlabs_bazel_distribution_requirement("webencodings")
    ],
    target = ":client_python"
)


deploy_github(
    name = "deploy-github",
    release_description = "//:RELEASE_TEMPLATE.md",
    deployment_properties = "//:deployment.properties",
    version_file = "//:VERSION"
)

py_test(
    name = "test_concept",
    srcs = [
        "tests/integration/base.py",
        "tests/integration/test_concept.py"
    ],
    deps = [
        ":client_python",
        graknlabs_client_python_requirement("forbiddenfruit")
    ],
    data = ["@graknlabs_grakn_core//:assemble-mac-zip"],
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
        graknlabs_client_python_requirement("forbiddenfruit")
    ],
    data = ["@graknlabs_grakn_core//:assemble-mac-zip"],
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
        graknlabs_client_python_requirement("forbiddenfruit")
    ],
    data = ["@graknlabs_grakn_core//:assemble-mac-zip"],
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
