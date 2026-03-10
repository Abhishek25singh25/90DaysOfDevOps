# Day 43 – GitHub Actions: Jobs, Outputs & Conditional Workflows

## 📌 Overview

On Day 43 of my DevOps learning journey, I focused on understanding how to structure smarter CI pipelines using **GitHub Actions**.
I explored multi-job workflows, environment variables, job outputs, conditional execution, and finally built a smart pipeline combining these concepts.

---

# 1️⃣ Multi-Job Workflow

I created a workflow with three separate jobs:

* **Build** → Builds the application
* **Test** → Runs only after the build job completes
* **Deploy** → Runs only after the test job succeeds

This was achieved using **job dependencies**.

### Workflow Flow

```
Build → Test → Deploy
```

This ensures that each stage runs only after the previous stage succeeds.

---

# 2️⃣ Environment Variables

Environment variables help store values that can be reused during the workflow execution.

I used variables at three levels:

| Level          | Variable    | Example |
| -------------- | ----------- | ------- |
| Workflow Level | APP_NAME    | myapp   |
| Job Level      | ENVIRONMENT | staging |
| Step Level     | VERSION     | 1.0.0   |

### GitHub Context Variables

I also explored GitHub’s built-in context variables:

* **github.sha** → Shows the commit SHA
* **github.actor** → Shows who triggered the workflow

These help track workflow execution and debugging.

---

# 3️⃣ Passing Outputs Between Jobs

In this task:

* The **first job generated an output** (today's date).
* The **second job accessed and printed that output**.

### Why Job Outputs Are Important

Passing outputs between jobs allows workflows to **share information across pipeline stages**.

Examples include:

* Build version
* Timestamp
* Artifact name
* Deployment environment

This enables better communication between jobs.

---

# 4️⃣ Conditional Execution

I implemented different types of conditions to control when steps or jobs should run.

Examples include:

* Running a step **only on the main branch**
* Running a step **only if the previous step fails**
* Running a job **only for push events**
* Using **continue-on-error**

### continue-on-error

`continue-on-error: true` allows a step to fail **without stopping the entire workflow**.
The pipeline continues executing the remaining steps.

This is useful when a step is optional or non-critical.

---

# 5️⃣ Smart Pipeline Workflow

Finally, I created a **smart CI pipeline** that includes:

### Parallel Jobs

* **Lint Job**
* **Test Job**

Both run **simultaneously** to speed up pipeline execution.

### Summary Job

After both jobs finish, a **summary job** runs that prints:

* Whether the push occurred on the **main branch** or a **feature branch**
* The **commit message**

### Pipeline Structure

```
Lint        Test
   \        /
    \      /
     Summary
```

This structure ensures efficient and organized pipeline execution.

---

# 📚 Key Takeaways

* GitHub Actions allows building powerful CI pipelines.
* Jobs can run **sequentially or in parallel**.
* **Outputs enable communication between jobs.**
* **Conditions help control workflow execution.**
* Smart pipeline design improves automation efficiency.

---

# 🚀 Conclusion

Day 43 helped me understand how to combine **jobs, outputs, and conditions** to build smarter CI pipelines using GitHub Actions.
These concepts are essential for designing scalable and efficient CI/CD workflows.

---

### 🔖 Tags

#90DaysOfDevOps
#DevOpsKaJosh
#GitHubActions
#TrainWithShubham
