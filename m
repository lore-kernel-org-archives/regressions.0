Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3220F11CB2
	for <regressions@lists.linux.dev>; Wed,  5 Jul 2023 15:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99CAC433CA;
	Wed,  5 Jul 2023 15:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1688572090;
	bh=Rh/XXFDPeNjLpSLDOfoQxNVnuVqJA08oaNBBe/oSECs=;
	h=Date:To:From:Subject:From;
	b=JL134JDbQio1epxB+hqGwixL8vp/pRmzgOoSWrFJqtEJUeL1kEcHJMUFnrb+T5mew
	 N/+hcccs+PBGYlSolnB6nCpI/qYAtXI1lYnW2qjzNMWyQM59PBFQVEUIMTWymSNx2W
	 Z5eYX9BWz6M0h2/egLVhEeayqaIwgA6ryHGPHrIU=
Date: Wed, 05 Jul 2023 08:48:09 -0700
To: mm-commits@vger.kernel.org,willy@infradead.org,will@kernel.org,vbabka@suse.cz,stable@vger.kernel.org,songliubraving@fb.com,shakeelb@google.com,rppt@kernel.org,rientjes@google.com,regressions@lists.linux.dev,punit.agrawal@bytedance.com,peterz@infradead.org,peterx@redhat.com,paulmck@kernel.org,mingo@redhat.com,minchan@google.com,michel@lespinasse.org,mhocko@suse.com,mgorman@techsingularity.net,luto@kernel.org,lstoakes@gmail.com,Liam.Howlett@oracle.com,ldufour@linux.ibm.com,kent.overstreet@linux.dev,joelaf@google.com,jirislaby@kernel.org,jannh@google.com,jacobly.alt@gmail.com,hughd@google.com,holger@applied-asynchrony.com,hdegoede@redhat.com,hannes@cmpxchg.org,gthelen@google.com,gregkh@linuxfoundation.org,edumazet@google.com,dhowells@redhat.com,david@redhat.com,dave@stgolabs.net,chriscli@google.com,bigeasy@linutronix.de,bagasdotme@gmail.com,axelrasmussen@google.com,surenb@google.com,akpm@linux-foundation.org
From: Andrew Morton <akpm@linux-foundation.org>
Subject: + mm-disable-config_per_vma_lock-until-its-fixed.patch added to mm-hotfixes-unstable branch
Message-Id: <20230705154809.D99CAC433CA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>


The patch titled
     Subject: mm: disable CONFIG_PER_VMA_LOCK until its fixed
has been added to the -mm mm-hotfixes-unstable branch.  Its filename is
     mm-disable-config_per_vma_lock-until-its-fixed.patch

This patch will shortly appear at
     https://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new.git/tree/patches/mm-disable-config_per_vma_lock-until-its-fixed.patch

This patch will later appear in the mm-hotfixes-unstable branch at
    git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

Before you just go and hit "reply", please:
   a) Consider who else should be cc'ed
   b) Prefer to cc a suitable mailing list as well
   c) Ideally: find the original patch on the mailing list and do a
      reply-to-all to that, adding suitable additional cc's

*** Remember to use Documentation/process/submit-checklist.rst when testing your code ***

The -mm tree is included into linux-next via the mm-everything
branch at git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
and is updated there every 2-3 working days

------------------------------------------------------
From: Suren Baghdasaryan <surenb@google.com>
Subject: mm: disable CONFIG_PER_VMA_LOCK until its fixed
Date: Tue, 4 Jul 2023 23:37:11 -0700

A memory corruption was reported in [1] with bisection pointing to the
patch [2] enabling per-VMA locks for x86.  Disable per-VMA locks config to
prevent this issue while the problem is being investigated.  This is
expected to be a temporary measure.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=217624
[2] https://lore.kernel.org/all/20230227173632.3292573-30-surenb@google.com

Link: https://lkml.kernel.org/r/20230705063711.2670599-3-surenb@google.com
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reported-by: Jiri Slaby <jirislaby@kernel.org>
Closes: https://lore.kernel.org/all/dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.org/
Reported-by: Jacob Young <jacobly.alt@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217624
Fixes: 0bff0aaea03e ("x86/mm: try VMA lock-based page fault handling first")
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Axel Rasmussen <axelrasmussen@google.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Chris Li <chriscli@google.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>
Cc: David Rientjes <rientjes@google.com>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Greg Thelen <gthelen@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Holger Hoffstätte <holger@applied-asynchrony.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jann Horn <jannh@google.com>
Cc: Joel Fernandes <joelaf@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lstoakes@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Michel Lespinasse <michel@lespinasse.org>
Cc: Mike Rapoport (IBM) <rppt@kernel.org>
Cc: Minchan Kim <minchan@google.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: <peterz@infradead.org>
Cc: Punit Agrawal <punit.agrawal@bytedance.com>
Cc: <regressions@lists.linux.dev>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Shakeel Butt <shakeelb@google.com>
Cc: Song Liu <songliubraving@fb.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Will Deacon <will@kernel.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/Kconfig |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/mm/Kconfig~mm-disable-config_per_vma_lock-until-its-fixed
+++ a/mm/Kconfig
@@ -1224,8 +1224,9 @@ config ARCH_SUPPORTS_PER_VMA_LOCK
        def_bool n
 
 config PER_VMA_LOCK
-	def_bool y
+	bool "Enable per-vma locking during page fault handling."
 	depends on ARCH_SUPPORTS_PER_VMA_LOCK && MMU && SMP
+	depends on BROKEN
 	help
 	  Allow per-vma locking during page fault handling.
 
_

Patches currently in -mm which might be from surenb@google.com are

fork-lock-vmas-of-the-parent-process-when-forking.patch
mm-disable-config_per_vma_lock-until-its-fixed.patch
swap-remove-remnants-of-polling-from-read_swap_cache_async.patch
mm-add-missing-vm_fault_result_trace-name-for-vm_fault_completed.patch
mm-drop-per-vma-lock-when-returning-vm_fault_retry-or-vm_fault_completed.patch
mm-change-folio_lock_or_retry-to-use-vm_fault-directly.patch
mm-handle-swap-page-faults-under-per-vma-lock.patch
mm-handle-userfaults-under-vma-lock.patch
mm-disable-config_per_vma_lock-by-default-until-its-fixed.patch

