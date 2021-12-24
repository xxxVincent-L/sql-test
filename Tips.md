# Tips : )

## Day1:
* **Temp tables:**
    ```sql
    (SELECT s_id, s_score FROM score WHERE score.c_id="01")as a
    ```

    **(SELECT xxx FROM xxx WHERE xxx) AS XXX**

    This way make the attributes easy to process especially in natural join or something.

* **Structure**：

  ```
  SELECT FROM
  WHERE
  GROUP BY  HAVING
  ORDER BY
  ```
  You have to be familiar with this structure!

  * **Group By**:
  * **Having**:

---

## Day2:

![image.png](https://s2.loli.net/2021/12/24/MGfwYtS3urhX8RD.png)

* **Union**:

  Getting the tuples of two different 'select' into one.

* **In**:

  You are supposed to figure out the **scope** of front and back parameters of 'In'.

* **DISTINCT**:

  The 'DISTINCT' in a sql using 'in' should be paid more attention!

![image.png](https://s2.loli.net/2021/12/24/ixqL3t1j4bCmoR7.png)

* **Group By**:
  Put all the tuples with the same s_id and s_name into one tuples which will be output.

* **Last Name**:
  It is like 'xxx%yyy'.
      : )
---
