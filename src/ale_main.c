/*
 *  Copyright 2014 Frank Hunleth
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Main implementation.
 */

#include <err.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int pru_main(int argc, char *argv[]);

int main(int argc, char *argv[])
{
    if (argc < 2)
        errx(EXIT_FAILURE, "Must pass mode (e.g. pru)");

    if (strcmp(argv[1], "pru") == 0)
        return pru_main(argc, argv);
    else
        errx(EXIT_FAILURE, "Unknown mode '%s'", argv[1]);

    return 1;
}
