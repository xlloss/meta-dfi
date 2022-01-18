#include <stdlib.h>
#include <stdio.h>
#include <termios.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>
#include <getopt.h>
#include <linux/serial.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <sys/types.h>

/*
 * useage :
 *      ${CC} -O2 ./rs485_initial_port.c -o rs485_initial_port
 *      rs485_initial_port1 -p /dev/ttymxc0 -b 115200
 */

int speed_arr[] = {B230400, B115200, B57600, B38400, B19200, B9600};
int name_arr[] = {230400, 115200, 57600, 38400, 19200, 9600,};
int ports_baudrate = 115200;

int get_baudrate(int speed)
{
    int i;

    for (i = 0; i < sizeof(speed_arr) / sizeof(int); i++) {
        if(speed == name_arr[i])
            return speed_arr[i];
    }
    return B115200;
}

int serial_init(char *dev_path, int speed)
{
    struct serial_rs485 ctrl485;
    struct termios newtio;
    int fd, status;
    int baud = get_baudrate(speed);

    fd = open(dev_path, O_RDWR);
    if (fd < 0)
        goto err;

    /* clear struct for new port settings */
    bzero(&newtio, sizeof(newtio));

    /* man termios get more info on below settings */
    newtio.c_cflag = baud | CS8 | CLOCAL | CREAD ;

    newtio.c_iflag = 0;
    newtio.c_oflag = 0;
    newtio.c_lflag = 0;

    /* block for up till N characters */
    newtio.c_cc[VMIN] = 8;

    /* ms-sec seconds read timeout */
    newtio.c_cc[VTIME] = 10;

    /* now clean the modem line and activate the settings for the port */
    tcflush(fd, TCIOFLUSH);
    tcsetattr(fd, TCSANOW, &newtio);

    status = ioctl(fd, TIOCGRS485, &ctrl485);
    if (status) {
       printf("config 485 port TIOCGRS485 fail, status (%i)\n", status);
       return -1;
    }

    /* Enable RS-485 mode: */
    ctrl485.flags |= SER_RS485_ENABLED;
    ctrl485.flags &= ~(SER_RS485_RTS_ON_SEND);
    ctrl485.flags |= SER_RS485_RTS_AFTER_SEND;

    /* ctrl485.flags |= SER_RS485_RX_DURING_TX; */

    ctrl485.delay_rts_before_send = 0;
    ctrl485.delay_rts_after_send = 0;

    status = ioctl(fd, TIOCSRS485, &ctrl485);
    if (status) {
       printf("config 485 port TIOCSRS485 fail, status (%i)\n", status);
       return -1;
    }

    return fd;

err:
    return -1;
}

void about(const char *name)
{
    printf("usage: %s options...\n", name);
    printf(" options:\n");

    printf("  -p --port=<port name>      "
           "The port name should be called /dev/ttyXXX\n");

    printf("  -b --baudrate=<baudrate>   "
           "Enter a specific baudrate value. Default is 115200\n");

    printf("                             "
           "Baudrate support: 230400, 115200, 57600, 38400,\n");

    printf("                             ""19200, 9600\n");
    printf("  -r --result                "
           "Return test result. 0 is pass; >0 is fail\n");

    printf("  -h --help                  ""This screen.\n");
    exit(1);
}

int main(int argc, char* argv[])
{
    static struct option options[] = {
        {"port",          required_argument,    NULL,    'p' },
        {"baudrate",      required_argument,    NULL,    'b' },
        {"help",          no_argument,          NULL,    'h' },
        {0,               0,                    0,        0  }
    };

    int opt, ret, i;
    char serial_port[16] = "\0";
    int test_result = 0;

    while ((opt = getopt_long(argc, argv, "c:p:b:",
        options, NULL)) != -1) {

        switch(opt) {
            case 'p':
                if (strlen(optarg) == 0) {
                    printf("%s:specific a serial port\n", argv[0]);
                    exit(1);
                }

                snprintf(serial_port, sizeof(serial_port), "%s", optarg);
                break;

            case 'b':
                if (strlen(optarg) == 0) {
                    printf("%s:specific a baudrate\n", argv[0]);
                    exit(1);
                }
                ports_baudrate = atoi(optarg);
                break;

            case 'h':
            case '?':
            default:
                about(argv[0]);
                break;
        }
    }

    if (argc == 1)
        about(argv[0]);

    serial_init(serial_port, ports_baudrate);
    printf("%s Port Initial...\n", serial_port);
    return 0;
}
