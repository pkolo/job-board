## Job Board API Endpoint Documentation

#### Serves full CRUD resources for `jobs`, via the following endpoints:



`GET /api/jobs`

Returns a list of all jobs.

Sample success response:

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
          "date_posted": "2017-08-06T22:03:02Z",
          "category": {"name": "Home", "id": 1},
          "location": {"city": "Brooklyn", "state": "NY", "id": 1}
        },
        ...
      ]
  }
  ```

`POST /api/jobs`

Creates a new job, then returns an object representing that job.

Sample payload:

```
"job": {
    "title": "I need a bedroom painted",
    "details": "The bedroom is 8'x10', and the walls are roughly 9' high. I have already purchased the paint, but would need                you to bring rollers, ladder, lights, and any other equipment you might require.",
    "category_name": "Home",
    "location_attributes": {
      "city": "Brooklyn",
      "state": "NY"
    }
  }
}
```

Sample success response:

```
{
  "code": 201,
  "messages": [],
  "result":
    {
      "id": 1,
      "title": "I need a bedroom painted",
      "details": "The bedroom is 8'x10', and the walls are roughly 9' high. I have already purchased the paint, but would need you to bring rollers, ladder, lights, and any other equipment you might require.",
      "date_posted": "2017-08-06T22:03:02Z",
      "category": {"name": "Home", "id": 1},
      "location": {"city": "Brooklyn", "state": "NY", "id": 1}
    }
}
```

Sample failed response:

```
{
  "code": 422,
  "messages": ["Title can't be blank,Details can't be blank"],
  "result": []
}
```

`GET /api/jobs/{job_id}`

Returns a job associated with a given id.

Sample success response:

```
{
  "code": 200,
  "messages": [],
  "result":
    {
      "id": 1,
      "title": "I need a bedroom painted",
      "details": "The bedroom is 8'x10', and the walls are roughly 9' high. I have already purchased the paint, but would need you to bring rollers, ladder, lights, and any other equipment you might require.",
      "date_posted": "2017-08-06T22:03:02Z",
      "category": {"name": "Home", "id": 1},
      "location": {"city": "Brooklyn", "state": "NY", "id": 1}
    }
}
```

Sample failed response:

```
{
  "code": 404,
  "messages": ["Record not found."],
  "result": []
}
```

`PUT /api/jobs/{job_id}`

Updates a job associated with a give id, then returns that job.

Sample payload:

```
"job": {
    "title": "I need a bedroom painted",
    "details": "The bedroom is 8'x10', and the walls are roughly 9' high. I have already purchased the paint, but would need                you to bring rollers, ladder, lights, and any other equipment you might require.",
    "category_name": "Home",
    "location_attributes": {
      "city": "Queens",
      "state": "NY"
    }
  }
}

Sample success response:

```
{
  "code": 200,
  "messages": ["Job successfully updated."],
  "result":
    {
      "id": 1,
      "title": "I need a bedroom painted",
      "details": "The bedroom is 8'x10', and the walls are roughly 9' high. I have already purchased the paint, but would need you to bring rollers, ladder, lights, and any other equipment you might require.",
      "date_posted": "2017-08-06T22:03:02Z",
      "category": {"name": "Home", "id": 1},
      "location": {"city": "Queens", "state": "NY", "id": 1}
    }
}
```

Sample failed response:

```
{
  "code": 422,
  "messages": ["Title can't be blank,Details can't be blank"],
  "result": []
}
```

`DELETE /api/jobs/{job_id}`

Deletes a job associated with a give id.

Sample success response:

```
{
  "code": 200,
  "messages": ["Job successfully deleted."],
  "result": []
}
```
