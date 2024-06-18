Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C37D16B389;
	Tue, 18 Jun 2024 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718720560; cv=none; b=qXP+0Na2B7voFkn70HYHbir6wzQXsrZ+tnNEQt6Pkq/OzgfZvsQDXwdowP6TUeMQC6D4C/qAKaucrwtDtI/XhSlcboT7HwTxTBqsGpssWOOWJizdms+5yOyzSpmfR4Y8TCzELvHH5Iw/xL4m1FsjHWdTvkj9HbznRo/4xYe9XO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718720560; c=relaxed/simple;
	bh=Aymw1eYrSYYqzPxNiCgFCK+tMexb3c1HiH4E894GEg0=;
	h=Subject:To:Cc:From:Date:Message-ID:MIME-Version:Content-Type; b=QXC3hg0rjJA3vTI0QK51HPH+hLhf2As/lnfKUibEo8o1e4rRXOFxCMa9GXXpywRjQJXR2sVSGX2RAINpry7SAFcQoBZwDqJdEuKNx/rAqAVPZl3af7qkG3VqXjgFSDp3vPWNOFT8QedtmsoGqqHtQvfsgY1jXe0Z6M/jbGLmMhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LWMT+7/h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LWMT+7/h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D5BC3277B;
	Tue, 18 Jun 2024 14:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718720560;
	bh=Aymw1eYrSYYqzPxNiCgFCK+tMexb3c1HiH4E894GEg0=;
	h=Subject:To:Cc:From:Date:From;
	b=LWMT+7/hDmjOJWVqsk4cxz73dD3A+XB1HpJuvXeU+7fnYXTVSTQY+R7dRBCOKU5yo
	 HDExEsKhk8aKPUHFmhxeMo8MLJxG9zn+YJmmxowlL5PLnK7IlhOHRCyIQU9k3dyyQ7
	 9A3DGCSIwzdzU6eE0gjrerMyNtdh7jbylET89Dvs=
Subject: Patch "drm/mst: Fix NULL pointer dereference at drm_dp_add_payload_part2" has been added to the 6.9-stable tree
To: Wayne.Lin@amd.com,alexander.deucher@amd.com,gregkh@linuxfoundation.org,harry.wentland@amd.com,imre.deak@intel.com,jani.nikula@intel.com,leon.weiss@ruhr-uni-bochum.de,lyude@redhat.com,regressions@lists.linux.dev
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 18 Jun 2024 16:21:25 +0200
Message-ID: <2024061824-psychic-dazzler-1785@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    drm/mst: Fix NULL pointer dereference at drm_dp_add_payload_part2

to the 6.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-mst-fix-null-pointer-dereference-at-drm_dp_add_payload_part2.patch
and it can be found in the queue-6.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 5a507b7d2be15fddb95bf8dee01110b723e2bcd9 Mon Sep 17 00:00:00 2001
From: Wayne Lin <Wayne.Lin@amd.com>
Date: Thu, 7 Mar 2024 14:29:57 +0800
Subject: drm/mst: Fix NULL pointer dereference at drm_dp_add_payload_part2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Wayne Lin <Wayne.Lin@amd.com>

commit 5a507b7d2be15fddb95bf8dee01110b723e2bcd9 upstream.

[Why]
Commit:
- commit 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/removement")
accidently overwrite the commit
- commit 54d217406afe ("drm: use mgr->dev in drm_dbg_kms in drm_dp_add_payload_part2")
which cause regression.

[How]
Recover the original NULL fix and remove the unnecessary input parameter 'state' for
drm_dp_add_payload_part2().

Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/removement")
Reported-by: Leon Weiß <leon.weiss@ruhr-uni-bochum.de>
Link: https://lore.kernel.org/r/38c253ea42072cc825dc969ac4e6b9b600371cc8.camel@ruhr-uni-bochum.de/
Cc: lyude@redhat.com
Cc: imre.deak@intel.com
Cc: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240307062957.2323620-1-Wayne.Lin@amd.com
(cherry picked from commit 4545614c1d8da603e57b60dd66224d81b6ffc305)
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c |    2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c             |    4 +---
 drivers/gpu/drm/i915/display/intel_dp_mst.c               |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c                   |    2 +-
 include/drm/display/drm_dp_mst_helper.h                   |    1 -
 5 files changed, 4 insertions(+), 7 deletions(-)

--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -363,7 +363,7 @@ void dm_helpers_dp_mst_send_payload_allo
 	mst_state = to_drm_dp_mst_topology_state(mst_mgr->base.state);
 	new_payload = drm_atomic_get_mst_payload_state(mst_state, aconnector->mst_output_port);
 
-	ret = drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, new_payload);
+	ret = drm_dp_add_payload_part2(mst_mgr, new_payload);
 
 	if (ret) {
 		amdgpu_dm_set_mst_status(&aconnector->mst_status,
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3421,7 +3421,6 @@ EXPORT_SYMBOL(drm_dp_remove_payload_part
 /**
  * drm_dp_add_payload_part2() - Execute payload update part 2
  * @mgr: Manager to use.
- * @state: The global atomic state
  * @payload: The payload to update
  *
  * If @payload was successfully assigned a starting time slot by drm_dp_add_payload_part1(), this
@@ -3430,14 +3429,13 @@ EXPORT_SYMBOL(drm_dp_remove_payload_part
  * Returns: 0 on success, negative error code on failure.
  */
 int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
-			     struct drm_atomic_state *state,
 			     struct drm_dp_mst_atomic_payload *payload)
 {
 	int ret = 0;
 
 	/* Skip failed payloads */
 	if (payload->payload_allocation_status != DRM_DP_MST_PAYLOAD_ALLOCATION_DFP) {
-		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
+		drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
 			    payload->port->connector->name);
 		return -EIO;
 	}
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1160,7 +1160,7 @@ static void intel_mst_enable_dp(struct i
 	if (first_mst_stream)
 		intel_ddi_wait_for_fec_status(encoder, pipe_config, true);
 
-	drm_dp_add_payload_part2(&intel_dp->mst_mgr, &state->base,
+	drm_dp_add_payload_part2(&intel_dp->mst_mgr,
 				 drm_atomic_get_mst_payload_state(mst_state, connector->port));
 
 	if (DISPLAY_VER(dev_priv) >= 12)
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -915,7 +915,7 @@ nv50_msto_cleanup(struct drm_atomic_stat
 		msto->disabled = false;
 		drm_dp_remove_payload_part2(mgr, new_mst_state, old_payload, new_payload);
 	} else if (msto->enabled) {
-		drm_dp_add_payload_part2(mgr, state, new_payload);
+		drm_dp_add_payload_part2(mgr, new_payload);
 		msto->enabled = false;
 	}
 }
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -851,7 +851,6 @@ int drm_dp_add_payload_part1(struct drm_
 			     struct drm_dp_mst_topology_state *mst_state,
 			     struct drm_dp_mst_atomic_payload *payload);
 int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
-			     struct drm_atomic_state *state,
 			     struct drm_dp_mst_atomic_payload *payload);
 void drm_dp_remove_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_dp_mst_topology_state *mst_state,


Patches currently in stable-queue which might be from Wayne.Lin@amd.com are

queue-6.9/drm-mst-fix-null-pointer-dereference-at-drm_dp_add_payload_part2.patch
