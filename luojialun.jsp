<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ page import="java.util.*" %>
    <!DOCTYPE html>
    <html lang="zh-CN">

    <head>
      <meta charset="GB2312">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>三角形面积计算</title>
      <style>
        body {
          background-image: url('background.jpg');
          /* 设置背景图 */
          background-size: cover;
          /* 背景图覆盖整个页面 */
          background-position: center center;
          /* 背景居中显示 */
          font-family: Arial, sans-serif;
          /* 设置字体 */
          color: #fff;
          /* 设置文字颜色 */
          text-align: center;
          padding: 50px;
        }

        .container {
          background-color: rgba(0, 0, 0, 0.6);
          /* 半透明黑色背景 */
          padding: 20px;
          border-radius: 10px;
          /* 圆角 */
          box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.3);
          /* 文字阴影 */
          max-width: 600px;
          margin: 0 auto;
          /* 居中容器 */
        }

        h1 {
          font-size: 2em;
        }

        input[type="text"] {
          padding: 10px;
          font-size: 1em;
          margin: 10px 0;
          border-radius: 5px;
          width: 50%;
        }

        input[type="submit"] {
          padding: 10px 20px;
          font-size: 1em;
          border-radius: 5px;
          background-color: #4CAF50;
          /* 提交按钮颜色 */
          color: #fff;
          border: none;
          cursor: pointer;
        }

        input[type="submit"]:hover {
          background-color: #45a049;
          /* 鼠标悬停按钮颜色 */
        }

        .result {
          margin-top: 20px;
          font-size: 1.2em;
          background-color: rgba(255, 255, 255, 0.6);
          /* 半透明白色背景 */
          padding: 15px;
          border-radius: 5px;
        }
      </style>
    </head>

    <body>

      <div class="container">
        <h1>计算三角形面积</h1>
        <p>请输入三角形的三个边的长度，输入的数字用英文逗号分隔：</p>
        <form action="luojialun.jsp" method="post" name="form">
          <input type="text" name="boy" placeholder="例如：3,4,5" required>
          <br>
          <input type="submit" value="输出" name="submit">
        </form>

        <%! double a[]=new double[3]; String answer=null; %>

          <% int i=0; boolean b=true; String s=null; double result=0; double a[]=new double[3]; String answer=null;
            s=request.getParameter("boy"); if (s !=null) { StringTokenizer fenxi=new StringTokenizer(s, ",，" ); while
            (fenxi.hasMoreTokens()) { String temp=fenxi.nextToken(); try { a[i]=Double.valueOf(temp).doubleValue(); i++;
            } catch (NumberFormatException e) { out.print("<BR>" + "请输入数字字符");
            }
            }

            if (a[0] + a[1] > a[2] && a[0] + a[2] > a[1] && a[1] + a[2] > a[0] && b == true) {
            double p = (a[0] + a[1] + a[2]) / 2;
            result = Math.sqrt(p * (p - a[0]) * (p - a[1]) * (p - a[2]));
            out.print("<div class='result'>面积：" + result + "</div>");
            } else {
            answer = "您输入的三边不能构成一个三角形";
            out.print("<div class='result'>" + answer + "</div>");
            }
            }
            %>

            <% if (s !=null) { %>
              <div class="result">
                <p>您输入的三边是：</p>
                <p>
                  <%= a[0] %>
                </p>
                <p>
                  <%= a[1] %>
                </p>
                <p>
                  <%= a[2] %>
                </p>
              </div>
              <% } %>
      </div>

    </body>

    </html>
