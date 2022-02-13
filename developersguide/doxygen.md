# Doxygen: Source docs {#doxygen}

@tableofcontents

We use [Doxygen](https://www.doxygen.nl/manual/docblocks.html) for source code documentation, including class hierarchy diagrams. We recommend the developers to extensively comment their code using Doxygen format which is used to automatically generate a highly useful source code documentation. You can also refer the coding style on this [CMU website](https://www.cs.cmu.edu/~410/doc/doxygen.html).

In general, we use following syntax for commentary, but any Doxygen compatible syntax can be used. 

## C++ Documentation

1. We mark a comment block as follows

        /**
        * ... text ...
        */

2. Each comment block describes a source code component, including files, classes and class members. Doxygen provide a large set of [commands](https://www.doxygen.nl/manual/commands.html) which can be included in the comment block as follows

        /**
        * @brief  A brief description of something
        *
        * @param <name> ... text ... (Explain a function parameter)
        * 
        * @param[in] <name> ... text ... (Explain an input param)
        * @param[out] <name> ... text ... (Explain an output param)
        * @param[in/out] <name> ... text ... (BOTH)
        *       
        * @bug ... text ... (A description of bug in the code)
        *
        * @deprecated ... text ... (Put a deprecation warning)
        *
        * @note ... text ... (Highlight some notes)
        *
        * @warning ... text ... (Red Highlight something)
        *
        * @todo ... text ... (Something to be done)
        */

3. An example of an acceptable documentation of a C++ source file, `example.hxx`

        /**
        * @file example.hxx
        * @author <name1> <(email1)>
        * @author <name2> <(email2)>
        * @brief ... text ...
        * @version 0.1
        * @date 2021-12-15
        * 
        * @copyright Copyright (c) 2021
        * 
        */

         /**
        * @brief ... text ...
        * 
        * @tparam T1 ... text ...
        * @tparam T2 ... text ...
        */
        template <typename T1, typename T2>
        class Example{

            private:

            /**
            * @brief ... text ...
            * 
            */
            T2 m1;

            public: 

            /**
            * @brief ... text ...
            * 
            * @param t1 ... text ...
            * @return true 
            * @return false 
            */
            virtual bool F1(T1 p1);
        };


## Python Documentation

1.  We mark a comment block as follows

        """!
        ... text ...
        """

2. An example of an acceptable documentation of a Python source file, `example.py`

        #!/usr/bin/env python3

        """!
        @file example.py
        @brief ... text ...
        @details ... text ..
        @author <name1> <(email1)>
        @author <name2> <(email2)>
        @version <MAJOR.MINOR>
        @date 2021-12-15

        @copyright Copyright (c) 2021
        """

