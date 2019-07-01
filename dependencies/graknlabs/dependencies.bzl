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

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def graknlabs_build_tools():
    git_repository(
        name = "graknlabs_build_tools",
        remote = "https://github.com/graknlabs/build-tools",
        commit = "b5b9f44fc074aa91cda43b4ca8468634bfb44482", # sync-marker: do not remove this comment, this is used for sync-dependencies by @graknlabs_build_tools
    )

def graknlabs_protocol():
#    git_repository(
#        name = "graknlabs_protocol",
#        remote = "https://github.com/graknlabs/protocol",
#        commit = "e9cb7fa417822247e26cd571e838688f11b4ae35", # sync-marker: do not remove this comment, this is used for sync-dependencies by @graknlabs_protocol
#    )
    native.local_repository(
        name = "graknlabs_protocol",
        path = "/Users/haikalpribadi/Workspace/repos/graknlabs/protocol"
    )

def graknlabs_grakn_core():
    git_repository(
        name = "graknlabs_grakn_core",
        remote = "https://github.com/graknlabs/grakn",
        commit = "b221251b13882789c2ed95e4cd24b2327e068711" # sync-marker: do not remove this comment, this is used for sync-dependencies by @graknlabs_grakn_core
    )
