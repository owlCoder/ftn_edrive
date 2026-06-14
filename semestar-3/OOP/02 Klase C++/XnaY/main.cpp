#include "xnay.hpp"

int main()
{
    XnaY s1;
    XnaY s2(3, 2);
    XnaY s3(s1);

    cout << "----------- S1 ----------" << endl << s1;
    cout << "-------------------------" << endl << endl;

    cout << "----------- S2 ----------" << endl << s2;
    cout << "-------------------------" << endl << endl;

    s3.setX_Y(2, 10);
    cout << "----------- S3 ----------" << endl << s3;
    cout << "-------------------------" << endl << endl;

    return 0;
}
