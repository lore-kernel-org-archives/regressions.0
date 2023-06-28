Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED2110795
	for <regressions@lists.linux.dev>; Wed, 28 Jun 2023 19:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDECEC433C8;
	Wed, 28 Jun 2023 19:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687978893;
	bh=JDkFjIz0jxeheOkafiKvaa79RxB3kCJOjNE4yhy5AM4=;
	h=Subject:To:Cc:From:Date:From;
	b=AwXY3MqVk2Q3oxxVFcTnUZZM/DZsBP1YIRJ6AAQcMe+KxzUnQmYIatSukvzNECUOe
	 eRwqmpoOmERgUGQkacVnS8eCjyvdvAKHWymZeTOitYqsDntTNr2FXJhCY+oYhBSr+G
	 7umdjDyUF6fvhqy62n8sfrh6g0MF+dJuy4VW0rjw=
Subject: Patch "drm/amdgpu: Set vmbo destroy after pt bo is created" has been added to the 5.15-stable tree
To: Philip.Yang@amd.com,alexander.deucher@amd.com,christian.koenig@amd.com,gregkh@linuxfoundation.org,mario.limonciello@amd.com,regressions@lists.linux.dev
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 28 Jun 2023 21:01:30 +0200
Message-ID: <2023062830-devoutly-drift-f8e8@gregkh>
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

    drm/amdgpu: Set vmbo destroy after pt bo is created

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-amdgpu-set-vmbo-destroy-after-pt-bo-is-created.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 9a3c6067bd2ee2ca2652fbb0679f422f3c9109f9 Mon Sep 17 00:00:00 2001
From: Philip Yang <Philip.Yang@amd.com>
Date: Mon, 3 Oct 2022 13:03:26 -0400
Subject: drm/amdgpu: Set vmbo destroy after pt bo is created
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philip Yang <Philip.Yang@amd.com>

commit 9a3c6067bd2ee2ca2652fbb0679f422f3c9109f9 upstream.

Under VRAM usage pression, map to GPU may fail to create pt bo and
vmbo->shadow_list is not initialized, then ttm_bo_release calling
amdgpu_bo_vm_destroy to access vmbo->shadow_list generates below
dmesg and NULL pointer access backtrace:

Set vmbo destroy callback to amdgpu_bo_vm_destroy only after creating pt
bo successfully, otherwise use default callback amdgpu_bo_destroy.

amdgpu: amdgpu_vm_bo_update failed
amdgpu: update_gpuvm_pte() failed
amdgpu: Failed to map bo to gpuvm
amdgpu 0000:43:00.0: amdgpu: Failed to map peer:0000:43:00.0 mem_domain:2
BUG: kernel NULL pointer dereference, address:
 RIP: 0010:amdgpu_bo_vm_destroy+0x4d/0x80 [amdgpu]
 Call Trace:
  <TASK>
  ttm_bo_release+0x207/0x320 [amdttm]
  amdttm_bo_init_reserved+0x1d6/0x210 [amdttm]
  amdgpu_bo_create+0x1ba/0x520 [amdgpu]
  amdgpu_bo_create_vm+0x3a/0x80 [amdgpu]
  amdgpu_vm_pt_create+0xde/0x270 [amdgpu]
  amdgpu_vm_ptes_update+0x63b/0x710 [amdgpu]
  amdgpu_vm_update_range+0x2e7/0x6e0 [amdgpu]
  amdgpu_vm_bo_update+0x2bd/0x600 [amdgpu]
  update_gpuvm_pte+0x160/0x420 [amdgpu]
  amdgpu_amdkfd_gpuvm_map_memory_to_gpu+0x313/0x1130 [amdgpu]
  kfd_ioctl_map_memory_to_gpu+0x115/0x390 [amdgpu]
  kfd_ioctl+0x24a/0x5b0 [amdgpu]

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
[ This fixes a regression introduced by commit 1cc40dccad76 ("drm/amdgpu:
  fix Null pointer dereference error in amdgpu_device_recover_vram") in
  5.15.118. It's a hand modified cherry-pick because that commit that
  introduced the regression touched nearby code and the context is now
  incorrect. ]
Cc: Linux Regressions <regressions@lists.linux.dev>
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2650
Fixes: 1cc40dccad76 ("drm/amdgpu: fix Null pointer dereference error in amdgpu_device_recover_vram")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |    1 -
 1 file changed, 1 deletion(-)

--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -685,7 +685,6 @@ int amdgpu_bo_create_vm(struct amdgpu_de
 	 * num of amdgpu_vm_pt entries.
 	 */
 	BUG_ON(bp->bo_ptr_size < sizeof(struct amdgpu_bo_vm));
-	bp->destroy = &amdgpu_bo_vm_destroy;
 	r = amdgpu_bo_create(adev, bp, &bo_ptr);
 	if (r)
 		return r;


Patches currently in stable-queue which might be from Philip.Yang@amd.com are

queue-5.15/drm-amdgpu-set-vmbo-destroy-after-pt-bo-is-created.patch
