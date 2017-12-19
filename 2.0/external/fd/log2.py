import logging
import logging.handlers
import os
import time
import datetime
import threading
import inspect
import traceback
import sys
import functools


tls = threading.local()


def setup_logger(filename, logger_name=None):
    print ("Logger setup")
    import config
    logger = logging.getLogger(logger_name)
    outhandler = logging.handlers.RotatingFileHandler(filename, 'a', 50*1024*1024, 10)
    logger.addHandler(outhandler)
    logger.setLevel(getattr(logging, config.get_config().logging_level))
    formatter = logging.Formatter("[%(asctime)s.%(msecs)03d %(threadName)s] %(message)s", "%H:%M:%S")
    outhandler.setFormatter(formatter)
    console_handler = logging.StreamHandler()
    console_handler.setLevel(logging.INFO)
    console_handler.setFormatter(formatter)


class FunctionCallLogger():

    def __init__(self, logger):
        self.logger = logger
        self.storage = tls
        self.separator = '| '

    def __call__(self, func):
        @functools.wraps(func)
        def wrapper(*pargs, **kwargs):
            start = self.prepare(func, pargs, kwargs)

            try:
                result = func(*pargs, **kwargs)
                end = time.time()
                self.logger.debug(self.prefix + 'Duration: {}, Result: {}'.format(datetime.timedelta(seconds=end - start), self.loggable(result)))
            except Exception as e:
                end = time.time()
                self.logger.debug(self.prefix + 'Duration: {0}, Result: {1}, '.format(datetime.timedelta(seconds=end - start), repr(e)))
                raise e
            finally:
                self.storage.indent -= 1
            return result
        return wrapper

    def prepare(self, func, pargs, kwargs):
        if not hasattr(self.storage, 'indent'):
            self.storage.indent = 0
        args = inspect.getfullargspec(func).args
        arg_slice = 1 if len(args) > 0 and args[0] == 'self' else 0
        str_pargs = ', '.join(self.loggable(x) for x in pargs[arg_slice:])
        str_kwargs = ', '.join(self.loggable(k) + '=' + self.loggable(v) for k, v in kwargs.items())
        str_args = str_pargs + ', ' * bool(str_pargs) * bool(str_kwargs) + str_kwargs
        trace = traceback.extract_stack(limit=4)
        self.logger.debug(self.prefix + '{}({})'.format(func.__name__, str_args))
        self.storage.indent += 1
        self.logger.debug(self.prefix + 'From {}:{}'.format(os.path.basename(trace[-3][0]), trace[-3][1]))
        start = time.time()
        return start

    @property
    def prefix(self):
        return 'Call: {}'.format(self.storage.indent * self.separator)

    def loggable(self, arg):
        return ['{0} {1}'.format(type(arg), len(arg)) if hasattr(arg, '__len__') else type(arg)][0] if hasattr(arg, '__len__') and len(arg) > 200 else repr(arg)


def logged(*args, **kwargs):
    if len(args) == 1 and not kwargs and callable(args[0]):
        f = args[0]
        logger = logging.getLogger(LOG)
        return FunctionCallLogger(logger)(f)

    def logged_wrapped(f):
        return FunctionCallLogger(kwargs.get('logger'))(f)
    return logged_wrapped

