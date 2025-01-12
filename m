Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C7D153BE4
	for <regressions@lists.linux.dev>; Sun, 12 Jan 2025 09:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736675737; cv=none; b=aN4F81SYXeu//pLHgg+MDcV6C4diEb+GsuvqVwVauaDzPrmNEnjJUNY8Ai3PWl/kHW17DDRU3J32ES0LbFXCOnv9tbysUwHJ1ynNH2jIVW/jDLokjfeshlrQp0WcPEXtMUGa8F884kG05b7gGWAx1kYinwGk5gf0J9ScOkamEDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736675737; c=relaxed/simple;
	bh=5LgN3kghoTo+6hcMs9ps9ijUlydUFsGCZ5ZnuL33xl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=KyH9rBZz3gBLoQGggC7x7FXZyGJpX9oLxtyfWmz0Dpb693cPmOa7g8MpOMNGj3i1X9cSu+Ix1KhfjbXcQRL0agi9+dlQxwlGNZ+x/0P+T//Ow6JsUY+f8tf46Ob8muv0M17SORBUZsLeym+MehR4wQxMdCeztT5gzwT3s2ZPEow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gj/iOerU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gj/iOerU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LbPMvXWxkqoPEVecK8C7xcWKRlslEHctKLKomp3MgmA=;
	b=Gj/iOerUo+UE0anCbABSP6rVFVb+IFje1InB0Vzsx9h0s/UXtbQ/jgbJRZLl8kicY6aM31
	8GYGPEQXpeMYTcSfpRtOH+CtcYDPHZRG/tqnfRCsHg8ktuo6MCCpqa3WmgJcOI4N9AIxC3
	SBFEnm6ar8sN8HUbf4t9EPbidswq9Ek=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-pdFrRNauMRm_mWxqXuztXg-1; Sun, 12 Jan 2025 04:55:32 -0500
X-MC-Unique: pdFrRNauMRm_mWxqXuztXg-1
X-Mimecast-MFC-AGG-ID: pdFrRNauMRm_mWxqXuztXg
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5d3cef3ed56so3297143a12.1
        for <regressions@lists.linux.dev>; Sun, 12 Jan 2025 01:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736675731; x=1737280531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbPMvXWxkqoPEVecK8C7xcWKRlslEHctKLKomp3MgmA=;
        b=nMt6Tt5UQwp19PC0oSBF3j0a0553TSrg5m9S8r32KgTje9wkIWpyha41EegEv56agX
         p8VLYySCMW2Q8f+HopUhmDC1riwO3IA9V/wADTuTsj4r34IGBSXoD0AJ7Mi2m3jhdA3/
         nDCLzEsL00aSi5uYyF0KEN8q2Q/wWiBikbbLOLmimAx79uabsKBQZ8V8hkCNfJa1ZtDM
         AoRHI6tLxYTLWBFPc/EJAHzEyK+QHJMnuR9D9az44iApGLSCbgWHB8sjrIqPOHQhgh/t
         Wn+SMKCiVFo2EKAcCnF281aaYzhelgdDe2iAMtKOl0VYuraFuRyJHmvR6EqdlKaFDipB
         +8sg==
X-Forwarded-Encrypted: i=1; AJvYcCUKbV11OoiyZ0CC3yhDX3BevnpFs4ilAmiBu0k5DLjva71c5UdSTu5yMsgOlyUYvuXtTiT84K3tmSgYaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8C+h2JKqCuAgWL895v26hDbd1KOR5ayQ0IjHpBzvCqj3rzQpm
	dZHXEGbbbqmP9IHQL6VocjBEF4du+RiCJKBj7DXJ7ui9PDsMtUtVlnR7VwbklPTGHlyfwLwl9CI
	K1L2oE4OdE7NLsYCHEY8A0ZTBOAfdjY4y594iN9+ZXpKxGjamfr5Mblkmhjw2
X-Gm-Gg: ASbGnctkuZkHfeInGZWB2HOnHy0GJHenZwzlYCZ+RHxn/9UvoMvD+JcuL0ggOLykFw6
	MBVs1OzQfSEilBDR8G4cXwlgKVHx16pfjICNdSm/nxVKrKNv7r7it6Mp2iPMpjXz1Oc2izntOET
	lODiMG3o+7Qi9ubu9pEeNgbdjGmFVkFVqaEvOSP7bpoJhuaVCZTSzYYvyFV8Dp154pQ8B2moSmp
	smH4Y8FgFMre0+Z/o/Ydg2NJWuKTz9XlPZ4E7SKqhrR/rsP2oTBWq+dmXg=
X-Received: by 2002:a05:6402:354c:b0:5d3:ba42:e9d6 with SMTP id 4fb4d7f45d1cf-5d972e14828mr16993853a12.17.1736675731150;
        Sun, 12 Jan 2025 01:55:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVLh0vGs9D36Q0IyXZ3HUQ2iOTSRSffuWayJjX6NDL6ISEn6UK/f5SUb1xvo4fnr5VPoS7bQ==
X-Received: by 2002:a05:6402:354c:b0:5d3:ba42:e9d6 with SMTP id 4fb4d7f45d1cf-5d972e14828mr16993834a12.17.1736675730719;
        Sun, 12 Jan 2025 01:55:30 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c3206sm3714091a12.46.2025.01.12.01.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 01:55:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev,
	Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PATCH v2 0/5] KVM: e500: map readonly host pages for read, and cleanup
Date: Sun, 12 Jan 2025 10:55:22 +0100
Message-ID: <20250112095527.434998-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NwW2UwlWCoF5UO9Eh1ZDmEwSTv3MSAGttpJrvMPr4EU_1736675731
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The new __kvm_faultin_pfn() function is upset by the fact that e500
KVM ignores host page permissions - __kvm_faultin requires a "writable"
outgoing argument, but e500 KVM is passing NULL.

While a simple fix would be possible that simply allows writable to
be NULL, it is quite ugly to have e500 KVM ignore completely the host
permissions and map readonly host pages as guest-writable.  A more
complete fix is present in the second to fourth patches (the first is
an independent bugfix, Cc'd to stable).

The last one removes the VMA-based attempts at building huge shadow TLB
entries, in favor of using a PTE lookup similar to what is done for x86.
This special casing of VM_PFNMAP does not work well with remap_pfn_range()
as it assumes that VM_PFNMAP areas are contiguous.  Note that the same
incorrect logic is there in ARM's get_vma_page_shift() and RISC-V's
kvm_riscv_gstage_ioremap().

Fortunately, for e500 most of the code is already there; it just has to
be changed to compute the range from find_linux_pte()'s output rather
than find_vma().  The new code works for both VM_PFNMAP and hugetlb
mappings, so the latter is removed.

If this does not work out I'll go for something like
https://lore.kernel.org/kvm/Z3wnsQQ67GBf1Vsb@google.com/, but
with the helper in arch/powerpc/kvm/e500_mmu_host.c.

Patches 2-5 were tested by the reporter, Christian Zigotzky.  Since
the difference with v1 is minimal, I am going to send it to Linus
today.

Thanks,

Paolo

v1->v2: do not bother checking again that a memslot exists, instead
	add a fix to restore irqs even if !ptep


Paolo Bonzini (5):
  KVM: e500: always restore irqs
  KVM: e500: use shadow TLB entry as witness for writability
  KVM: e500: track host-writability of pages
  KVM: e500: map readonly host pages for read
  KVM: e500: perform hugepage check after looking up the PFN

 arch/powerpc/kvm/e500.h          |   2 +
 arch/powerpc/kvm/e500_mmu_host.c | 199 +++++++++++++------------------
 2 files changed, 85 insertions(+), 116 deletions(-)

-- 
2.47.1

