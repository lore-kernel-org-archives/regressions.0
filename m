Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039F62DB788
	for <regressions@lists.linux.dev>; Mon,  6 Apr 2026 11:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775474491; cv=pass; b=m28MlVtNCqz4THKqkx9615AVtCU9eehoYMAVu6MQofZka7KBTrL0Njydp7zv43pBYiw4nJAIh3VbT5anlpnAT9WlV+Oehz6MWl5vM/ZFtXIVzdn3m772K6ooL6SLBteqQEvD0S0HWm24UM/hht3p9ts98l+rqj7UqFoaWQVm1Q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775474491; c=relaxed/simple;
	bh=+n62Xi89zk6CnVw+XF8IGOE3ZI3q8T6CvEvyJgo7J/Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WeDKusDf3vFD3k0qMKFDTzwllLhDUzkw+rppt1AjzJEKQEzV8Sg40/DAaIWkxVDVIjNz6TTBlR28jGG/9cJucW3XuKW0NTbTjix52OP0DAZzmkDe7jWKUTsdBnqiwcURnkHeN6qXbXDc60Gdx7YY2HyrvUArBvdH6km4S8P4sJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gsb0bamG; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gsb0bamG"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1271257ae53so3874888c88.1
        for <regressions@lists.linux.dev>; Mon, 06 Apr 2026 04:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775474489; cv=none;
        d=google.com; s=arc-20240605;
        b=PpjZDTfN1P0n9zARc7KCy4v85nAKVToaWgJ8U5LAACAYwKFQ898D2cneKxBz/hoia+
         HdoQqVDcByzb0TYyXfW0cmvNwhqvSwdjbFgbeLahJH2JM33H2IPpTFKoFG8jLoEdOly8
         Yqk1drr/8XJlhOn7vb7x3mJRmcFEgUEWjkS0fdGgwPXSviVAudpouwAsNgc2NzF6bLaI
         tvIh/jzAQ3MLzxnsCo7K+Fj5wBpgXCAzDNWMYNjoYKoB0xyWiLES/LVOLNAzkwxMmiZy
         6Hk/Bxpavk85ddaFYovhJ3CX3YMV6ApRdUtvypXm9n+pBqMzDcYJoQ2RrJdyMhoI2rnj
         9ETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=t95BVlFfdvOs5fw/SGxCyY2QTrIHnmC9oYmVhJdlUk4=;
        fh=JEIm+rbLHOqa9DJJkD+yZ2CKdGd2CbuPyfCwmWT1LsU=;
        b=BCCMZI+FX0B6g+7anpoFKu6zA4D6UAVrgyPF9Mq2Ohr1AYvFD/lIutOfgS/GpStpgg
         6V1AgkvMkWKCRpmr0q+hAvggSobF4PtCjnK6wk3bETOLkarBOJz1fURkqVjKLpxhWgye
         NqZWc6CBAPFdkbKwy1eFBXfAa04GNmUMkkn/XhWKtsJios61UNdqOf4zZH9t/eA+F/7S
         56VZKhATNLER5WPE04pOOqRU5yGMk7oN7qfPxOi+MZCT5iMDekrH0F7rxwuqCN2//4IM
         96+oJIWGb69bTtPZVBuCpHPhy8godpNOohgajPTeiK3LjyhWonWXN5ZvEBlXFyC0UhBW
         eeLw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775474489; x=1776079289; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t95BVlFfdvOs5fw/SGxCyY2QTrIHnmC9oYmVhJdlUk4=;
        b=Gsb0bamG8IEJeDvYJy1kBsTyTPiXpYe0uRei5zLhCge0laH9ocy0Wy/fbNVGEOpBre
         9tEd+ommgttdLeWfnsgl5mNZUCkM2WpeOCWMQhk/wETwNvIiNaj/NgYiUHGfrKmZNgAm
         cSze0fgMm3b8fNkSmUlnPJganLwCVuRBVQXkmmebvkVAkHdsFy0i6MrLvUud2JSCHC69
         NnBjiLo29Ts/rmb3fMxdfRAV6HSvlL9kcboGnYz8CrOGbxMMFKvjMaqG/pIk9P/rZxC1
         H66rAnYQFa29hlQEwqGHvY9ofaBYgk9lRpztcQyfchi6cPheu++3epR6UpQiGj22UCTp
         YUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775474489; x=1776079289;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t95BVlFfdvOs5fw/SGxCyY2QTrIHnmC9oYmVhJdlUk4=;
        b=pXBiueKHuBrQe89nJ44oII4zmY70q2LOykOaDZZLjz5dx90bBUY8QGA/aYXi9f4k9o
         oIiBMjpLTNkdC+DDARKUNGEznSCZS4p/NXvOtlsyb3eQfl87j9WVP7AGxKAiNlTBwm2t
         p0PrrCYipygyl5MplwExbgGzxwZLFQXb9kTrbvv7ksztoGTSeKOjsmegZwe03mjuOrx8
         d/SokJdL5PlqkbnwPw+Z6OMHyktO/nwnqf0DHLC9DxtN3oa/47UWJ+Yb4YgL9T0hLNes
         pi3H+tF9nRVYNyb/JNbKUnqf56iAtDb5cdgW8toYScRdbuLgTAi2QlVAOMkxXELf9nvh
         bbTg==
X-Forwarded-Encrypted: i=1; AJvYcCXaUbuyBjUS0d/u8kK29eLBttE2qQV1T7mEuoPU6PI6X756hNrA1vSluRBqELEQLx/mWsUS7anlpOFXfg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfFfGv6uq6KVcfU0XQGWN8MlWf5s5LfPa80jdh0s20Zbi3dOiN
	RCpTCbnFu1HVYHLSdowebsTYmsBxv+Bmu9BhmVOyCEWCqqM5nviPHOi9Abh7mBpDgp/4uxAFyzf
	lANoi1cY4IpMxNFwp8aAvson9NxoT1uA=
X-Gm-Gg: AeBDieviRQzEYQZUxKBZihTiJxF+P2gcq3gF2limn1/uBKSP6gYHgHYCJZUI5c+WP1D
	/0DqzOWEDmkG2puKO2vYuiJqOwyzMcnZ81awjsmGCUpUTuZFkZoCZWKfqXnZC/pSUi7/aA/DgLh
	kGKykl8COy/hYtCKtWjUVjEORb8qzp3B95tT26I+jmWuFKXaZP9ersQzcn/ycmtSfsxG+NdEXIc
	pLVBzKxXgq1aIGY87V0CEprUdlJjHsiLlChgRAgVtkauPduZQ7ZiJ2dt8LVEroYExxHK4n5slTA
	83I4Nmwb
X-Received: by 2002:a05:7022:6725:b0:128:cf5c:5356 with SMTP id
 a92af1059eb24-12bfb6ec488mr4917113c88.5.1775474489005; Mon, 06 Apr 2026
 04:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: chichina c <li17324910702@gmail.com>
Date: Mon, 6 Apr 2026 19:21:18 +0800
X-Gm-Features: AQROBzDeGLFT7O9eXFGoyzujv58rVUqO1IVJknTlZCTs1XTjGQpO0f6fVLpGbmo
Message-ID: <CAOKsz8yxa3Dj1TGiEwE+2Qkx=F520_pSeVSR6h265jkOxbJGUw@mail.gmail.com>
Subject: [BUG] virt: acrn: destroy_workqueue() called before eventfd wait
 queue removal in acrn_irqfd_deinit()
To: fei1.li@intel.com
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, yakui.zhao@intel.com, 
	shuo.a.liu@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi,

I found a teardown ordering bug in the ACRN irqfd cleanup path that can
lead to a use-after-free (queue_work() on an already-destroyed workqueue)
when an eventfd is closed concurrently with VM destruction.

Bug description
===============
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
panic_on_warn=1 this becomes a kernel panic (denial of service).

Note that hsm_irqfd_wakeup() does not hold irqfds_lock and has no
synchronization with acrn_irqfd_deinit(), so there is no existing
mechanism to close this race window.

Compare with KVM's irqfd implementation (virt/kvm/eventfd.c), which
correctly performs eventfd_ctx_remove_wait_queue() on every irqfd
*before* flushing/destroying any workqueue infrastructure.

Affected code
=============
File: drivers/virt/acrn/irqfd.c

  void acrn_irqfd_deinit(struct acrn_vm *vm)
  {
          struct hsm_irqfd *irqfd, *next;

          dev_dbg(acrn_dev.this_device, "VM %u irqfd deinit.\n", vm->vmid);
          destroy_workqueue(vm->irqfd_wq);         /* BUG: too early */
          mutex_lock(&vm->irqfds_lock);
          list_for_each_entry_safe(irqfd, next, &vm->irqfds, list)
                  hsm_irqfd_shutdown(irqfd);  /* removes wait queue entries */
          mutex_unlock(&vm->irqfds_lock);
  }

The invariant that must hold: all call sites that can invoke
queue_work(vm->irqfd_wq, ...) must be silenced before destroy_workqueue()
is called.  hsm_irqfd_wakeup() can only be silenced by removing the wait
queue entry via eventfd_ctx_remove_wait_queue(), which only happens inside
hsm_irqfd_shutdown().

Proposed fix
============
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
===============
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



Kernel version tested on 7.0-rc6

Fixes: aa3b483ff1d7 ("virt: acrn: Introduce irqfd")
Reported-by: chichi
