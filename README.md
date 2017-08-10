# Job Board API

#### Serves the following endpoints:

`GET /jobs`

Returns a list of all jobs.

  ```
  {
      "code": 200,
      "messages": [],
      "result":
        [
          {
            "id": 1,
            "title": "I need a bedroom painted",
            "details": "The bedroom is 8'x10', and the walls are roughly 9' high. I have already purchased the paint, but would need you to bring rollers, ladder, lights, and any other equipment you might require.",
            "date_posted": "08/25/2017",
            "category": {"name": "Home", "id": 1},
            "location": {"city": "Brooklyn", "state": "NY", "id": 1}
          },
          ...
        ]
    }
    ```

`POST /jobs`

Creates a new job.

  ```
  {
      "code": 201,
      "messages": [],
      "result":
        {
          "id": 1,
          "title": "I need a bedroom painted",
          "details": "The bedroom is 8'x10', and the walls are roughly 9' high. I have already purchased the paint, but would need you to bring rollers, ladder, lights, and any other equipment you might require.",
          "date_posted": "08/25/2017",
          "category": {"name": "Home", "id": 1},
          "location": {"city": "Brooklyn", "state": "NY", "id": 1}
        }
    }
    ```

`GET /jobs/{job_id}`

Returns a job associated with a give id.

```
{
    "code": 200,
    "messages": [],
    "result":
      {
        "id": 1,
        "title": "I need a bedroom painted",
        "details": "The bedroom is 8'x10', and the walls are roughly 9' high. I have already purchased the paint, but would need you to bring rollers, ladder, lights, and any other equipment you might require.",
        "date_posted": "08/25/2017",
        "category": {"name": "Home", "id": 1},
        "location": {"city": "Brooklyn", "state": "NY", "id": 1}
      }
  }
  ```

`PUT /jobs/{job_id}`

Updates a job associated with a give id.

```
{
    "code": 200,
    "messages": ["Job successfully updated."],
    "result":
      {
        "id": 1,
        "title": "I need a bedroom painted",
        "details": "The bedroom is 8'x10', and the walls are roughly 9' high. I have already purchased the paint, but would need you to bring rollers, ladder, lights, and any other equipment you might require.",
        "date_posted": "08/25/2017",
        "category": {"name": "Home", "id": 1},
        "location": {"city": "Brooklyn", "state": "NY", "id": 1}
      }
  }
  ```

`DELETE /jobs/{job_id}`

Deletes a job associated with a give id.

```
{
    "code": 200,
    "messages": ["Job successfully deleted."],
    "result": []
  }
  ```
