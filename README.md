# Job Board API

#### Serves the following endpoints:

`GET /jobs`

Returns a list of all jobs.

  ```
  {
      "status": "ok",
      "code": 200,
      "messages": [],
      "result":
        [
          {
            "id": 1,
            "title": "I need a bedroom painted",
            "details": "The bedroom is 8'x10', and the walls are roughly 9' high. I have already purchased the paint, but would need you to bring rollers, ladder, lights, and any other equipment you might require.",
            "date_posted": "08/25/2017",
            "category": "Home",
            "city": "Brooklyn, NY"
          },
          ...
        ]
    }
    ```

`POST /jobs`

Creates a new job.

  ```
  {
      "status": "ok",
      "code": 201,
      "messages": [],
      "result":
        {
          "id": 1,
          "title": "I need a bedroom painted",
          "details": "The bedroom is 8'x10', and the walls are roughly 9' high. I have already purchased the paint, but would need you to bring rollers, ladder, lights, and any other equipment you might require.",
          "date_posted": "08/25/2017",
          "category": "Home",
          "city": "Brooklyn, NY"
        }
    }
    ```

`GET /jobs/{job_id}`

Returns a job associated with a give id.

```
{
    "status": "ok",
    "code": 200,
    "messages": [],
    "result":
      {
        "id": 1,
        "title": "I need a bedroom painted",
        "details": "The bedroom is 8'x10', and the walls are roughly 9' high. I have already purchased the paint, but would need you to bring rollers, ladder, lights, and any other equipment you might require.",
        "date_posted": "08/25/2017",
        "category": "Home",
        "city": "Brooklyn, NY"
      }
  }
  ```

`PUT /jobs/{job_id}`

Updates a job associated with a give id.

```
{
    "status": "ok",
    "code": 200,
    "messages": ["Job successfully updated."],
    "result":
      {
        "id": 1,
        "title": "I need a bedroom painted",
        "details": "The bedroom is 8'x10', and the walls are roughly 9' high. I have already purchased the paint, but would need you to bring rollers, ladder, lights, and any other equipment you might require.",
        "date_posted": "08/25/2017",
        "category": "Home",
        "city": "Brooklyn, NY"
      }
  }
  ```

`DELETE /jobs/{job_id}`

Deletes a job associated with a give id.

```
{
    "status": "ok",
    "code": 200,
    "messages": ["Job successfully deleted."]
  }
  ```s
