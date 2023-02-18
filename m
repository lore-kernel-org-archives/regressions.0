Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D8A7F3
	for <regressions@lists.linux.dev>; Sat, 18 Feb 2023 08:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C1AC433D2;
	Sat, 18 Feb 2023 08:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1676707662;
	bh=y+vu0pH/C6aqC1FwmkJmV7uf3+TVF0rPVwHu5u66ieY=;
	h=Subject:To:Cc:From:Date:From;
	b=svp9oZXbGel2gifpPz+taj1n+zTXNqUNDnTr+65paV4jV4+SsviksW1YlOP7k+By0
	 vjMh6W/Qsj4XBLe26lBxfrZv2LdFG0GnDfptE7Rp3CCiTuR0Ou0wt7UZJFufu+D5X2
	 qBuV84Z+ZmEGX3J+lZT4U5QvaPoLZh35LcBGpMxY=
Subject: Patch "mm/migrate: fix wrongly apply write bit after mkdirty on sparc64" has been added to the 6.1-stable tree
To: 20221021160603.GA23307@u164.east.ru,20221212130213.136267-1-david@redhat.com,akpm@linux-foundation.org,david@redhat.com,gregkh@linuxfoundation.org,nbowler@draconx.ca,peterx@redhat.com,regressions@lists.linux.dev
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sat, 18 Feb 2023 09:06:35 +0100
Message-ID: <1676707595235175@kroah.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    mm/migrate: fix wrongly apply write bit after mkdirty on sparc64

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mm-migrate-fix-wrongly-apply-write-bit-after-mkdirty-on-sparc64.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 96a9c287e25d690fd9623b5133703b8e310fbed1 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Thu, 16 Feb 2023 10:30:59 -0500
Subject: mm/migrate: fix wrongly apply write bit after mkdirty on sparc64

From: Peter Xu <peterx@redhat.com>

commit 96a9c287e25d690fd9623b5133703b8e310fbed1 upstream.

Nick Bowler reported another sparc64 breakage after the young/dirty
persistent work for page migration (per "Link:" below).  That's after a
similar report [2].

It turns out page migration was overlooked, and it wasn't failing before
because page migration was not enabled in the initial report test
environment.

David proposed another way [2] to fix this from sparc64 side, but that
patch didn't land somehow.  Neither did I check whether there's any other
arch that has similar issues.

Let's fix it for now as simple as moving the write bit handling to be
after dirty, like what we did before.

Note: this is based on mm-unstable, because the breakage was since 6.1 and
we're at a very late stage of 6.2 (-rc8), so I assume for this specific
case we should target this at 6.3.

[1] https://lore.kernel.org/all/20221021160603.GA23307@u164.east.ru/
[2] https://lore.kernel.org/all/20221212130213.136267-1-david@redhat.com/

Link: https://lkml.kernel.org/r/20230216153059.256739-1-peterx@redhat.com
Fixes: 2e3468778dbe ("mm: remember young/dirty bit for page migrations")
Link: https://lore.kernel.org/all/CADyTPExpEqaJiMGoV+Z6xVgL50ZoMJg49B10LcZ=8eg19u34BA@mail.gmail.com/
Signed-off-by: Peter Xu <peterx@redhat.com>
Reported-by: Nick Bowler <nbowler@draconx.ca>
Acked-by: David Hildenbrand <david@redhat.com>
Tested-by: Nick Bowler <nbowler@draconx.ca>
Cc: <regressions@lists.linux.dev>
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 mm/huge_memory.c |    6 ++++--
 mm/migrate.c     |    2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3253,8 +3253,6 @@ void remove_migration_pmd(struct page_vm
 	pmde = mk_huge_pmd(new, READ_ONCE(vma->vm_page_prot));
 	if (pmd_swp_soft_dirty(*pvmw->pmd))
 		pmde = pmd_mksoft_dirty(pmde);
-	if (is_writable_migration_entry(entry))
-		pmde = maybe_pmd_mkwrite(pmde, vma);
 	if (pmd_swp_uffd_wp(*pvmw->pmd))
 		pmde = pmd_wrprotect(pmd_mkuffd_wp(pmde));
 	if (!is_migration_entry_young(entry))
@@ -3262,6 +3260,10 @@ void remove_migration_pmd(struct page_vm
 	/* NOTE: this may contain setting soft-dirty on some archs */
 	if (PageDirty(new) && is_migration_entry_dirty(entry))
 		pmde = pmd_mkdirty(pmde);
+	if (is_writable_migration_entry(entry))
+		pmde = maybe_pmd_mkwrite(pmde, vma);
+	else
+		pmde = pmd_wrprotect(pmde);
 
 	if (PageAnon(new)) {
 		rmap_t rmap_flags = RMAP_COMPOUND;
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -215,6 +215,8 @@ static bool remove_migration_pte(struct
 			pte = maybe_mkwrite(pte, vma);
 		else if (pte_swp_uffd_wp(*pvmw.pte))
 			pte = pte_mkuffd_wp(pte);
+		else
+			pte = pte_wrprotect(pte);
 
 		if (folio_test_anon(folio) && !is_readable_migration_entry(entry))
 			rmap_flags |= RMAP_EXCLUSIVE;


Patches currently in stable-queue which might be from peterx@redhat.com are

queue-6.1/mm-migrate-fix-wrongly-apply-write-bit-after-mkdirty-on-sparc64.patch
