Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D623314D0
	for <regressions@lists.linux.dev>; Mon,  6 Apr 2026 11:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775475514; cv=pass; b=sf68sToWnFvpS4UyOkiDxNaoERyw32PX6HTSmlFjgm4GsEjSsTM8ltn/+NrO2SvIU8BC7n/NNYN5TRF2dUiQ2jaiayaDmvxxE7j3Gf7u47xrUx4Gd7FKrjJ5Ea5OEeJGvt2xyFuaP1XzLT7KnEMWMfGUIwWlwOx0YIyNW2OAWw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775475514; c=relaxed/simple;
	bh=bnnbD36JRK1H0WmZABZ2TVcYz5ypqCF3La8J3Y5l9rw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdjQk/Xh9C9NUQX0QQMPYPSeTjAYpQ47RbzPPkzjE/xXsoK2niM6manih70Z6Ph3TGUDMFTPmn5CbooMtf954VNhdtK1ih0doVi2CoIKHgRlrSECrp/oAXD/vj1Ts4M4tH1B/24zER4j7kEzuQ/E7HrdBloWzLqTIhdOPQbpJJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WghYJCZP; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WghYJCZP"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1271195d2a7so8168836c88.0
        for <regressions@lists.linux.dev>; Mon, 06 Apr 2026 04:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775475512; cv=none;
        d=google.com; s=arc-20240605;
        b=SjBTVQsmtfPOD+rIj/Zqz9PFBQMZVY/6hGYplyumtf1tGidWrh4iVau2dIvtWwiUUz
         TRo5IufU0nlDrgq85SUzkxHFTULLPGDpBbkArrvASbyNRqbiFMmc3R4Z/lUaisR2tf1W
         pbi1AWSCFN6zqunz7Qz3GS2MzUX6mtFgR5IAd3iuEklIuGV8s2LxZzttUEZBbVfJtbIC
         T/arDouJNmp/7Ykev3wa2dHHVX0WrhLmy55GtAIjSiF0c+QvPSPy9qa3fQsqYSW3nVmO
         NnMFYT+WJId1PmGQXGwSfeSl5Ab7hULITqWuEPbFOSvYhrrM16740W6hh6HHLEo76spC
         Jjww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MTv8dwBsuDw9G43cN+a9fRgKYOA57T1yFLSQo5apy/w=;
        fh=efbfjp6f1loCS2gVuwecQTRcRdMYbn03vVj8wpARKb4=;
        b=SGBz9frBCe+Ce1NdHGbDlZr/5qHCEK78gRQyvdmzdbFLudkiMWvCcY7u3jB+6BYG8S
         /j0OEDdH4PtMuiIDOa/+DxlrXZwXDppyvNt5qtz2vZ5aURhQZZ2aDq7cYRvAuZ4EvdD/
         GHDD0nPeB2xKFEEergLzhFKDUQTs8hYHHUcPRvQuD3MrlhHEFX0IWPLYhcUEWRDLl4O5
         y8joy4EpaoJMy/He0fbOqvem5Bh0OCquNpzRGgyJeDYG1n6ARI13g5Jyj1t9RDnLRxRN
         3BJ3SneHw3Qbiq3dp03uDwya9s1Bk0LCHdaph7vT236bjpc5pML0CW5cP0VRzrwhibmC
         X6YQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775475512; x=1776080312; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTv8dwBsuDw9G43cN+a9fRgKYOA57T1yFLSQo5apy/w=;
        b=WghYJCZPwu7qJ6GCsC5D+iALBLe9/v6TTgUoWmZEp/yBcpbuQhX7shVJs9cuxzCmIw
         7pPfe47BkvCz2nhS5sP+c5bfEoV9q7XlRkcbXwfKimhjdTUKUnR0JVkT01Z4JrUhc5tA
         zdNxokYc2Dz7S3z2TtuRPOiWkg8lhB7NbiuqhzOuw+aSQcVz3ZnGz0rmckLecbrzTWp0
         s+dwmblK6PNAEz3BkeJqHq0Yfhqas8YOtOaqG2+n7f+q5Is5twZPD54/Z1M9cIOZ7bgJ
         Jh/JKPokxDlGCZPEqB8kCPU0TNjAeOldgliX9XoEOjWlQ0ArOPCJnyaCgcl5VEVH+MiY
         JulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775475512; x=1776080312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MTv8dwBsuDw9G43cN+a9fRgKYOA57T1yFLSQo5apy/w=;
        b=HOca0aEKF9XlN+UsMdXuCb/digfW+eZxUk33qRbW+Ru70mfWn1PQdDBRpsmYKmhp53
         uD87wyHfK3J1zBohfelswWGbbDZ/P1kqHT1WHEhNGL6NIcZfRZDayfV51Ll8osj+eJ0F
         9k/wPkp/U4v7TPmAd3g1EoqvEwZi5uknGvM0N+L4T91C1pzfuae6cpJA/nT1xNF9VXck
         0G/kN3ffduZf33PkObS3jKiO707tnED7kfuEZPkpnMiYNdCI2BT79PMJk0MAn7/FUyIx
         Y5/HxbTx2CGipx9f1tTGcL3up1NNufe7FlOPEv4Anc5F/IC/UF6JUwRyP/0fsUg/VmLb
         FXlg==
X-Forwarded-Encrypted: i=1; AJvYcCXB5Rxf9dQYfl6FlqYjMFFZPajjY2V/cIdHCQxrdtrWxDyRMgspiWHNwrFXOroQHk3NJ0IYBGSkz/JiVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwX3p+x5D01jLCmM7Y3ILgmmOz6zAFAUJ1dmAbl81LAa14WWle/
	2lbPlQeprRBBKwOhHU/05S812BeFQoiL0TyNXOBq0X87yAN/G0hGrBsshr7lAPWHn2uR3IfeXZN
	wKYwrG/A2Wyhtuw3wMVSgRoX46NGIL+ocmcZlS7tA+tg4
X-Gm-Gg: AeBDietsGljqYxFm5VWRwelHe9tufBlOd7vgX+0aersJ9BlbG9IwXzBwQumiYLTeYUl
	HmsW8W0hPiMctrrL5LElrX5imvgCTu+hXfFh8fA33G0uiQbrSQEZBwj2P/luNuED0xKfzJyh5oY
	6m5Fn9zj5DpmgqY1q+ffB7q0rZurc3puJTNCUvhPZm4ci8LZK54tZKomhiXseTN9WzQfW7yIIvw
	qbyt90XK/JGMeaa1Xcqh8To+BU4OVrprnbMTlLDXojczwDTqCh1CIMbZaYpSJbph/5H3cE9IrNT
	SkLv6NlV
X-Received: by 2002:a05:7022:6199:b0:128:d107:da0f with SMTP id
 a92af1059eb24-12bfb6fb627mr5618745c88.10.1775475511991; Mon, 06 Apr 2026
 04:38:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOKsz8yxa3Dj1TGiEwE+2Qkx=F520_pSeVSR6h265jkOxbJGUw@mail.gmail.com>
In-Reply-To: <CAOKsz8yxa3Dj1TGiEwE+2Qkx=F520_pSeVSR6h265jkOxbJGUw@mail.gmail.com>
From: chichina c <li17324910702@gmail.com>
Date: Mon, 6 Apr 2026 19:38:21 +0800
X-Gm-Features: AQROBzBURXUhSPg04MNKIAyCjYPyDCQNhMaVXd5bT34Mp0qbWqwVU1ZICL-F0CU
Message-ID: <CAOKsz8zLUQ_AtDWJ9uPfEjj5f1w2P8vFvD9wwWOb9pqJehK7HQ@mail.gmail.com>
Subject: Re: [BUG] virt: acrn: destroy_workqueue() called before eventfd wait
 queue removal in acrn_irqfd_deinit()
To: fei1.li@intel.com
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	acrn-dev@lists.projectacrn.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding this email address to the thread for
reference=EF=BC=9Aacrn-dev@lists.projectacrn.org.
=3D=3D=3D=3D=3D=3D



Hi,

I found a teardown ordering bug in the ACRN irqfd cleanup path that can
lead to a use-after-free (queue_work() on an already-destroyed workqueue)
when an eventfd is closed concurrently with VM destruction.

Bug description
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
In acrn_irqfd_deinit() (drivers/virt/acrn/irqfd.c:217-227), the cleanup
order is:

    1. destroy_workqueue(vm->irqfd_wq);          /* line 222 */
    2. list_for_each ... hsm_irqfd_shutdown(irqfd); /* line 224-225 */

hsm_irqfd_shutdown() calls eventfd_ctx_remove_wait_queue(), which removes
the irqfd's wait entry from the eventfd's wait queue.  However,
destroy_workqueue() is called BEFORE this removal, leaving the wait
entries live across the window between lines 222 and 225.

During that window, if an external process closes (or the kernel delivers
POLLHUP to) an eventfd that still has an irqfd attached, the wakeup
callback hsm_irqfd_wakeup() fires (irqfd.c:74-92) and calls:

    queue_work(vm->irqfd_wq, &irqfd->shutdown);   /* line 89 */

At this point vm->irqfd_wq has already been destroyed by
destroy_workqueue().  destroy_workqueue() sets the internal
__WQ_DESTROYING flag (kernel/workqueue.c), which causes __queue_work()
to emit WARN_ONCE and return early rather than corrupt heap directly -
but the ordering invariant is still violated and on kernels with
panic_on_warn=3D1 this becomes a kernel panic (denial of service).

Note that hsm_irqfd_wakeup() does not hold irqfds_lock and has no
synchronization with acrn_irqfd_deinit(), so there is no existing
mechanism to close this race window.

Compare with KVM's irqfd implementation (virt/kvm/eventfd.c), which
correctly performs eventfd_ctx_remove_wait_queue() on every irqfd
*before* flushing/destroying any workqueue infrastructure.

Affected code
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
File: drivers/virt/acrn/irqfd.c

  void acrn_irqfd_deinit(struct acrn_vm *vm)
  {
          struct hsm_irqfd *irqfd, *next;

          dev_dbg(acrn_dev.this_device, "VM %u irqfd deinit.\n", vm->vmid);
          destroy_workqueue(vm->irqfd_wq);         /* BUG: too early */
          mutex_lock(&vm->irqfds_lock);
          list_for_each_entry_safe(irqfd, next, &vm->irqfds, list)
                  hsm_irqfd_shutdown(irqfd);  /* removes wait queue entries=
 */
          mutex_unlock(&vm->irqfds_lock);
  }

The invariant that must hold: all call sites that can invoke
queue_work(vm->irqfd_wq, ...) must be silenced before destroy_workqueue()
is called.  hsm_irqfd_wakeup() can only be silenced by removing the wait
queue entry via eventfd_ctx_remove_wait_queue(), which only happens inside
hsm_irqfd_shutdown().

Proposed fix
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Move the irqfd shutdown loop before destroy_workqueue():

--- a/drivers/virt/acrn/irqfd.c
+++ b/drivers/virt/acrn/irqfd.c
@@ -217,9 +217,15 @@ void acrn_irqfd_deinit(struct acrn_vm *vm)
 {
        struct hsm_irqfd *irqfd, *next;

        dev_dbg(acrn_dev.this_device, "VM %u irqfd deinit.\n", vm->vmid);
-       destroy_workqueue(vm->irqfd_wq);
-       mutex_lock(&vm->irqfds_lock);
+
+       /*
+        * Shut down every irqfd first to remove all wait queue entries.
+        * This ensures hsm_irqfd_wakeup() can no longer call queue_work()
+        * on irqfd_wq before we destroy it.
+        */
+       mutex_lock(&vm->irqfds_lock);
        list_for_each_entry_safe(irqfd, next, &vm->irqfds, list)
                hsm_irqfd_shutdown(irqfd);
        mutex_unlock(&vm->irqfds_lock);
+
+       destroy_workqueue(vm->irqfd_wq);
 }

After this change destroy_workqueue() also implicitly flushes any
hsm_irqfd_shutdown_work instances that were already queued before deinit
started (e.g. from a racing POLLHUP that arrived before deinit), so the
flush semantics are preserved.

Additional note
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The teardown ordering bug above is real, but simply moving
destroy_workqueue(vm->irqfd_wq) after the deinit loop may still be
insufficient.

A racing POLLHUP may already have queued irqfd->shutdown before
acrn_irqfd_deinit() acquires irqfds_lock. If deinit then calls
hsm_irqfd_shutdown() directly and frees irqfd, a pending or in-flight
hsm_irqfd_shutdown_work() can later dereference the freed irqfd, turning
this into a different use-after-free.

So the safe teardown sequence may need to be:

    1. under irqfds_lock, detach each irqfd from vm->irqfds and remove
       its eventfd wait queue entry;
    2. keep detached irqfds alive temporarily;
    3. flush/destroy irqfd_wq so any previously queued shutdown work
       drains;
    4. only then drop eventfd references and free the detached irqfds.

This is closer to KVM's two-stage deactivate/cleanup model, where the
irqfd is first made inactive and unhooked from eventfd, and is freed
only after shutdown work has been flushed.
