Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A9C10E1
	for <regressions@lists.linux.dev>; Wed, 31 May 2023 01:27:47 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5659c7dad06so110847597b3.0
        for <regressions@lists.linux.dev>; Tue, 30 May 2023 18:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685496467; x=1688088467;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6SbvjI2oU1cdVXnK7cuFw0l0h6zw8bJpQklImtP7iBM=;
        b=QCuLbJdrt4GsbbawFWE62Bf//ModZntQPGigdyCejMwQehGD3AdISrI2E/Cv3D9vUl
         SwRsz1hWNf/z9/Wv8E2jp7NTtSvGnlq02BHbHRIN/7cH3m1/mT2lpql3I0MPAdG23EnO
         J86upqh7IkvzR0jKRSy1Gnwq9DkwkauD4Ln7gtbRSINpZe2Hsi7ZmziSihgwsUScH4Ge
         QM83gTHnnw8BYQdNtW2/pnsorIiVw128QyfQwxMgSxKzd6iMKw+2TeXa1UNbLzlsRLHC
         QRjKLSyTQy1EiWIPOnfNX23E3cQDVHs4PxAKlfwK6dFBQmDQOl55m9iIj/cvhDaEJrIu
         1lvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685496467; x=1688088467;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6SbvjI2oU1cdVXnK7cuFw0l0h6zw8bJpQklImtP7iBM=;
        b=fnOKZuOPgRBpp9GHH7rJtVZ841Z/D7MQyFVWU+1sg5flBzhrGZlgrDhrGcrbwDYGw5
         A5ANSezuc84jxvmd41bxMG0Fe9ZV4YN8qHYQ1vc6D3tVaV3qpMYr5mBuTPDfjryYYXLZ
         tkmzC7Ux77wa28vLKpXmKprXihVoXuZ2Rtabq5Acta+ozk3bpclizRnIm1P8xbOp8WL/
         OWSbZNkTKuso3mD2B+U46kuX4CpHquJSP7Nte5dB7T44qbFJb42oDrLfv9Q6yV6Q9EGa
         /6QggOknUxr+dvM1oXgVNVVhioIv+UrycGvWcoEOmg7O8RMel2w68qqwOa6Qb0PfDRLo
         mU1A==
X-Gm-Message-State: AC+VfDw3lfMYi+XkS3sGx5r0shxoiuAlR3QmCOT+d8Idc6dEcr95zR05
	cxeVGGeYx61tk0Tz1grJy/J1laY4SJ4=
X-Google-Smtp-Source: ACHHUZ4KreOqM9eQzcyu9254b2UVN7c9K8yk5+BFicJTNvZ67tbH7zIk19FdHnXYjyrWlIxH80y8c0Y8X5Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ad21:0:b0:565:bb48:2b57 with SMTP id
 l33-20020a81ad21000000b00565bb482b57mr2422356ywh.0.1685496466978; Tue, 30 May
 2023 18:27:46 -0700 (PDT)
Date: Tue, 30 May 2023 18:27:45 -0700
In-Reply-To: <ZHY0WkNlui91Mxoj@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CADpTngX9LESCdHVu_2mQkNGena_Ng2CphWNwsRGSMxzDsTjU2A@mail.gmail.com>
 <ZHNMsmpo2LWjnw1A@debian.me> <CADpTngWiXNh1wAFM_EYGm-Coa8nv61Tu=3TG+Z2dVCojp2K1yg@mail.gmail.com>
 <ZHY0WkNlui91Mxoj@google.com>
Message-ID: <ZHaikcUjbkq7yVbi@google.com>
Subject: Re: WARNING trace at kvm_nx_huge_page_recovery_worker on 6.3.4
From: Sean Christopherson <seanjc@google.com>
To: Fabio Coatti <fabio.coatti@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, kvm@vger.kernel.org, 
	Junaid Shahid <junaids@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, May 30, 2023, Sean Christopherson wrote:
> On Tue, May 30, 2023, Fabio Coatti wrote:
> > Il giorno dom 28 mag 2023 alle ore 14:44 Bagas Sanjaya
> > <bagasdotme@gmail.com> ha scritto:
> > > #regzbot ^introduced: v6.3.1..v6.3.2
> > > #regzbot title: WARNING trace at kvm_nx_huge_page_recovery_worker when opening a new tab in Chrome
> > 
> > Out of curiosity, I recompiled 6.3.4 after reverting the following
> > commit mentioned in 6.3.2 changelog:
> > 
> > commit 2ec1fe292d6edb3bd112f900692d9ef292b1fa8b
> > Author: Sean Christopherson <seanjc@google.com>
> > Date:   Wed Apr 26 15:03:23 2023 -0700
> > KVM: x86: Preserve TDP MMU roots until they are explicitly invalidated
> > commit edbdb43fc96b11b3bfa531be306a1993d9fe89ec upstream.
> > 
> > And the WARN message no longer appears on my host kernel logs, at
> > least so far :)
> 
> Hmm, more than likely an NX shadow page is outliving a memslot update.  I'll take
> another look at those flows to see if I can spot a race or leak.

I didn't spot anything, and I couldn't reproduce the WARN even when dropping the
dirty logging requirement and hacking KVM to periodically delete memslots.

printk debugging it is...  Can you run with this and report back?

---
 arch/x86/kvm/mmu/mmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index d3812de54b02..89c2e5ee7d36 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -855,6 +855,8 @@ void track_possible_nx_huge_page(struct kvm *kvm, struct kvm_mmu_page *sp)
 	if (!list_empty(&sp->possible_nx_huge_page_link))
 		return;
 
+	sp->mmu_valid_gen = kvm->arch.mmu_valid_gen;
+
 	++kvm->stat.nx_lpage_splits;
 	list_add_tail(&sp->possible_nx_huge_page_link,
 		      &kvm->arch.possible_nx_huge_pages);
@@ -7012,7 +7014,9 @@ static void kvm_recover_nx_huge_pages(struct kvm *kvm)
 		slot = NULL;
 		if (atomic_read(&kvm->nr_memslots_dirty_logging)) {
 			slot = gfn_to_memslot(kvm, sp->gfn);
-			WARN_ON_ONCE(!slot);
+			if (!WARN_ON_ONCE(!slot))
+				pr_warn_ratelimited("No slot for gfn = %llx, role = %x, TDP MMU = %u, root count = %u, gen = %u vs %u\n",
+						    sp->gfn, sp->role.word, sp->tdp_mmu_page, sp->root_count, sp->mmu_valid_gen, kvm->arch.mmu_valid_gen);
 		}
 
 		if (slot && kvm_slot_dirty_track_enabled(slot))

base-commit: 17f2d782f18c9a49943ea723d7628da1837c9204
-- 
