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
 * PRU port implementation.
 *
 * This code has been heavily modified from Erlang/ALE.
 * Copyright (C) 2013 Erlang Solutions Ltd.
 * See http://opensource.erlang-solutions.com/erlang_ale/.
 */

#include <err.h>
#include <poll.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include "erlcmd.h"

//#define DEBUG
#ifdef DEBUG
#define debug(...) do { fprintf(stderr, __VA_ARGS__); fprintf(stderr, "\r\n"); } while(0)
#else
#define debug(...)
#endif

#define RPMSG_BUF_SIZE 512

/*
 * PRU handling definitions and prototypes
 */

struct pru {
    int fd;
    int pin_number;
};

/**
 * @brief write a string to a sysfs file
 * @return returns 0 on failure, >0 on success
 */
int sysfs_write_file(const char *pathname, const char *value)
{
    int fd = open(pathname, O_WRONLY);
    if (fd < 0) {
        debug("Error opening %s", pathname);
        return 0;
    }

    size_t count = strlen(value);
    ssize_t written = write(fd, value, count);
    close(fd);

    if (written < 0 || (size_t) written != count) {
        debug("Error writing '%s' to %s", value, pathname);
        return 0;
    }

    return written;
}

// PRU functions

/**
 * @brief	Open and configure a PRU
 *
 * @param	pin           The pin structure
 * @param	pin_number    The PRU pin
 * @param   dir           Direction of pin (input or output)
 *
 * @return 	1 for success, -1 for failure
 */
int pru_init(struct pru *pin, unsigned int pin_number)
{
    /* Initialize the pin structure. */
    pin->fd = -1;
    pin->pin_number = pin_number;

    char value_path[64];
    sprintf(value_path, "/dev/rpmsg_pru%d", pin_number); // pin_number needs to be 31 (32/30?)

    /* Open the value file for quick access later */
    pin->fd = open(value_path, O_RDWR);
    if (pin->fd < 0)
        return -1;

    return 1;
}

/**
 * @brief	Set pin with the value "0" or "1"
 *
 * @param	pin           The pin structure
 * @param       value         Value to set (0 or 1)
 *
 * @return 	1 for success, -1 for failure
 */
int pru_write(struct pru *pin, char *wr_msg, long wr_len)
{
    ssize_t amount_written = pwrite(pin->fd, wr_msg, wr_len, 0);
    if (amount_written < (ssize_t) wr_len)
        err(EXIT_FAILURE, "pwrite overwrite");

    return 1;
}

/**
* @brief	Read the value of the pin
*
* @param	pin            The PRU pin
*
* @return 	The pin value if success, -1 for failure
*/
long pru_read(struct pru *pin, char *rd_msg, long rd_len)
{
    long amount_read = (long) pread(pin->fd, rd_msg, rd_len, 0);
    if (amount_read > rd_len)
        err(EXIT_FAILURE, "pread");

    return amount_read;
}

/**
 * Called after poll() returns when the PRU sysfs file indicates
 * a status change.
 *
 * @param pin which pin to check
 */
void pru_process(struct pru *pin)
{
    debug("read");
    long rd_len;
    char rd_msg[RPMSG_BUF_SIZE+1];

    rd_len = pru_read(pin, rd_msg, sizeof(rd_msg));

    char resp[256+RPMSG_BUF_SIZE];
    int resp_index = sizeof(uint16_t); // Space for payload size

    resp[resp_index++] = 'n'; // Notification

    ei_encode_version(resp, &resp_index);
    ei_encode_tuple_header(resp, &resp_index, 2);
    ei_encode_atom(resp, &resp_index, "read");
    ei_encode_binary(resp, &resp_index, rd_msg, rd_len);

    erlcmd_send(resp, resp_index);
}

void pru_handle_request(const char *req, void *cookie)
{
    struct pru *pin = (struct pru *) cookie;

    // Commands are of the form {Command, Arguments}:
    // { atom(), term() }
    int req_index = sizeof(uint16_t);
    if (ei_decode_version(req, &req_index, NULL) < 0)
        errx(EXIT_FAILURE, "Message version issue?");

    int arity;
    if (ei_decode_tuple_header(req, &req_index, &arity) < 0 ||
            arity != 2)
        errx(EXIT_FAILURE, "expecting {cmd, args} tuple");

    char cmd[MAXATOMLEN];
    if (ei_decode_atom(req, &req_index, cmd) < 0)
        errx(EXIT_FAILURE, "expecting command atom");

    char resp[256+RPMSG_BUF_SIZE];
    int resp_index = sizeof(uint16_t); // Space for payload size
    resp[resp_index++] = 'r'; // Response
    ei_encode_version(resp, &resp_index);

    if (strcmp(cmd, "read") == 0) {
        errx(EXIT_FAILURE, "read: only interrupts supported");
    /*     debug("read"); */
    /*     char rd_msg[RPMSG_BUF_SIZE+1]; */
    /*     long rd_len = pru_read(pin, rd_msg, RPMSG_BUF_SIZE); */

    /*     if (rd_len >= 0) { */
    /*       //ei_encode_binary(resp, &resp_index, rd_msg, rd_len); */
    /*         ei_encode_tuple_header(resp, &resp_index, 2); */
    /*         ei_encode_atom(resp, &resp_index, "read"); */
    /*         ei_encode_binary(resp, &resp_index, rd_msg, rd_len); */
    /*     } */
    /*     else { */
    /*         ei_encode_tuple_header(resp, &resp_index, 2); */
    /*         ei_encode_atom(resp, &resp_index, "error"); */
    /*         ei_encode_atom(resp, &resp_index, "pru_read_failed"); */
    /*     } */
    } 

    if (strcmp(cmd, "write") == 0) {
        long wr_len;
        int wr_type, wr_size;
        char wr_msg[RPMSG_BUF_SIZE+1];

        // int ei_get_type(const char *buf, const int *index, int *type, int *size) 
        //if (ei_decode_long(req, &req_index, &value) < 0)
        ei_get_type(req, &req_index, &wr_type, &wr_size); 

        if (wr_type != ERL_BINARY_EXT)
            errx(EXIT_FAILURE, "write: didn't get binary to write");

        if (wr_size >= RPMSG_BUF_SIZE)
            errx(EXIT_FAILURE, "write: binary message too long");

        if (ei_decode_binary(req, &req_index, &wr_msg, &wr_len))
            errx(EXIT_FAILURE, "write: couldn't get binary to write");

        wr_msg[RPMSG_BUF_SIZE] = '\0';

        debug("write %d", wr_msg);
        int wr_res = pru_write(pin, wr_msg, wr_len);

        if (wr_res != -1)
            ei_encode_atom(resp, &resp_index, "ok");
        else {
            ei_encode_tuple_header(resp, &resp_index, 2);
            ei_encode_atom(resp, &resp_index, "error");
            ei_encode_atom(resp, &resp_index, "pru_write_failed");
        }
    } else
        errx(EXIT_FAILURE, "unknown command: %s", cmd);

    debug("sending response: %d bytes", resp_index);
    erlcmd_send(resp, resp_index);
}

int pru_main(int argc, char *argv[])
{
    if (argc != 3)
        errx(EXIT_FAILURE, "%s pru <pin#>", argv[0]);

    int pin_number = strtol(argv[2], NULL, 0);

    struct pru pin;
    if (pru_init(&pin, pin_number) < 0)
        errx(EXIT_FAILURE, "Error initializing PRU RPmsg %d ", pin_number);

    struct erlcmd handler;
    erlcmd_init(&handler, pru_handle_request, &pin);

    for (;;) {
        struct pollfd fdset[2];

        fdset[0].fd = STDIN_FILENO;
        fdset[0].events = POLLIN;
        fdset[0].revents = 0;

        fdset[1].fd = pin.fd;
        fdset[1].events = POLLIN | POLLPRI;
        fdset[1].revents = 0;

        /* Always fill out the fdset structure, but only have poll() monitor
         * the sysfs file if interrupts are enabled.
        */

        // TODO: handle POLLOUT for writing to char driver (?)
        // From rpmsg_pru kernel driver... it seems to check for non-priority data:
        //mask = POLLOUT | POLLWRNORM;
        //if (!kfifo_is_empty(&prudev->msg_fifo))
        //  mask |= POLLIN | POLLRDNORM;


        int rc = poll(fdset, 2, -1); // always poll now
        if (rc < 0) {
            // Retry if EINTR
            if (errno == EINTR)
                continue;

            err(EXIT_FAILURE, "poll");
        }

        if (fdset[0].revents & (POLLIN | POLLHUP))
            erlcmd_process(&handler);

        if (fdset[1].revents & (POLLIN | POLLPRI))
            pru_process(&pin);
    }

    return 0;
}
