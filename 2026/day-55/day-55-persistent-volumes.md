# Kubernetes Storage Tasks (Day 55) – Complete Notes

---

## 🔹 Task 1: emptyDir Volume (Ephemeral Storage)

### Concept

* `emptyDir` is a temporary storage.
* It exists only as long as the Pod is running.

### Key Points

* Data is created inside the Pod.
* When the Pod is deleted → data is lost.

### Verification

* Timestamp changes after Pod recreation.

### Conclusion

> emptyDir is not persistent. Data is deleted with the Pod.

---

## 🔹 Task 2: PersistentVolume (Static Provisioning)

### Concept

* PV is actual storage created manually.

### Configuration

* Capacity: 1Gi
* Access Mode: ReadWriteOnce
* Reclaim Policy: Retain

### Status

* Initially: `Available`

### Conclusion

> PV remains available until claimed by a PVC.

---

## 🔹 Task 3: PersistentVolumeClaim (PVC)

### Concept

* PVC is a request for storage.

### Configuration

* Requested: 500Mi
* Access Mode: ReadWriteOnce

### Result

* PVC binds to PV → Status becomes `Bound`

### Verification

* VOLUME column shows: `my-pv`

### Conclusion

> PVC binds to a matching PV based on size and access mode.

---

## 🔹 Task 4: Pod with PVC (Persistent Data)

### Concept

* Pod uses PVC for storage.

### Behavior

* Write data → delete Pod → recreate Pod
* Data remains intact

### Verification

* File contains data from both Pods

### Conclusion

> PVC provides persistent storage across Pod restarts.

---

## 🔹 Task 5: StorageClass & Dynamic Provisioning

### Concept

* StorageClass automates PV creation.

### Important Fields

* Provisioner
* Reclaim Policy
* Volume Binding Mode

### Key Point

* Default StorageClass: `standard`

### Conclusion

> Developers only create PVC; PV is auto-created.

---

## 🔹 Task 6: Dynamic Provisioning

### Concept

* PV is automatically created when PVC is created.

### Special Case

* `WaitForFirstConsumer`

  * PV is created only when a Pod uses the PVC

### Result

* Total PVs: 2

  1. `my-pv` → Manual
  2. `pvc-xxxxx` → Dynamic

### Conclusion

> Dynamic provisioning simplifies storage management.

---

## 🔹 Task 7: Cleanup

### Steps

1. Delete Pods
2. Delete PVCs
3. Check PVs

### Result

* Dynamic PV → Deleted
* Manual PV → Released

### Reason

* Dynamic PV → Delete policy
* Manual PV → Retain policy

### Final Conclusion

> Reclaim policy determines whether PV is deleted or retained.

---

# 🔥 Final Revision (Quick Summary)

| Concept               | Behavior                |
| --------------------- | ----------------------- |
| emptyDir              | Data lost on Pod delete |
| PV                    | Manual storage          |
| PVC                   | Storage request         |
| PVC + Pod             | Persistent data         |
| StorageClass          | Auto PV creation        |
| Dynamic PV            | Auto-created            |
| Reclaim Policy Delete | PV deleted              |
| Reclaim Policy Retain | PV stays                |

---

# 🧠 One-Line Master Summary

> emptyDir is temporary, PVC provides persistence, and StorageClass enables automatic PV creation.

---

✅ End of Notes

