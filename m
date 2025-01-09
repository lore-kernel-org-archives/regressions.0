Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA3121E0BF
	for <regressions@lists.linux.dev>; Thu,  9 Jan 2025 13:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429905; cv=none; b=RgzNhfESEapV+M8VjXZp7a4O+VK8SkhwzI6QV19pFHGBzcAmxy/1Q8TEb5YJxSlVz8nth9Cl7smAyVfd64hUxMlqMt869oHNhs8l/U7xtDdg9Oqvd8xudo1QpQd5IUFA1isfv6pONp1jDqZR8aNrttozonHsbg8qs9lZwltoDy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429905; c=relaxed/simple;
	bh=tj0EaTI4xDK9nr89rwD+fHqfvdYzjn0WO9cVa0FoTrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=aB35zbZeRyUbdrQ6o698OXAEEPlkvDT2q2jUXxbANjzZ3gczP16YnwHeTkwgMzgQf+47HNTPWQ4aTUPVuLUUIsGbgOOiMoC+UmSLEG2PaO/p39x+KSIY8JXLLw6thj/JyB4UyWjOb9ZHc2yEtSghCE1ehqFSk+Rv6zdIFjI/2vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PpVaWtBK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PpVaWtBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uldQPwdfE7L9Dk1HaWI6s1M7Pg4/zwkf9XHa0qYWEsU=;
	b=PpVaWtBKyMcH6VP/1k6uoSfR9XALWS3Hbsk6W2+sH2gun9hZDq1+9t3GPYbmEtqNxwlwTI
	1ipL99SzNY0TMm1Smb4wdY361+WxsVpiJcyimp0LjTN9um/8xfKqwXHLR08xgf+waSLKf0
	aXXYKKmQ6zVZoXK5yzuGLEWC3+VDynU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-vZdtvF6iOGKK1VHHW_x7TQ-1; Thu, 09 Jan 2025 08:38:21 -0500
X-MC-Unique: vZdtvF6iOGKK1VHHW_x7TQ-1
X-Mimecast-MFC-AGG-ID: vZdtvF6iOGKK1VHHW_x7TQ
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa6704ffcaeso89955966b.2
        for <regressions@lists.linux.dev>; Thu, 09 Jan 2025 05:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736429900; x=1737034700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uldQPwdfE7L9Dk1HaWI6s1M7Pg4/zwkf9XHa0qYWEsU=;
        b=kuN7s+klNkvilIFrjiFIqw2anrJHC44lH1M1+kALr0O0pA9ul29gZa71j2p7uzuKp6
         h9I9b91TYOthOXYyStJ6Bq31Nddz4nxu+2cCYUTQIkbQgJM/A6tv14k86h1mecr7I41w
         eIT8A2vcH37PCKf4jpwEXkQsimtIka4pM9kMYTyuOZT7bSitCHjSs8DkccTNjZ3K7MCB
         26Hz8Vb3gIhVWjBKqDe+4zn7ZZcpv4HVTFh6PUu+X6T2A6W2nhI29ROY/7g5BxYRm8jH
         iNKAd7rPAx3SYjjcgzvvplX98QcO3IKihfYErTh/0++06ciSprlwizxildLcd0OOVWQS
         tuBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6FNu8IfFcLKlBOt/TTmcQBNHvqAhGBhK2OWzjZcwqijhjlWj5PfPR5mFUBNie7hSXZ3xjuqMtv/oJGA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3WuCPi7cZ5S0aU56yl6NCMQlv4+4vONEFbFJI3KL0lxJVOaFe
	MJQVhN26NQ5jND29bspytg/X38uvW+EeNy4XcZns7MHmKsvcG6ODTNRwV0asJoNqwSwJCgC0ZiT
	ALFCShx3+GGQmATCE8Jz4P4YQ2HXoRfrEvKumo4xSLSEXL1rDiVeN7fzo2mEZ
X-Gm-Gg: ASbGncuSBin0Ki4BjD8TXNZf+1aL8oWQLvjxhGungACFGoRLbE+WHbajZ9Y7eKd+R03
	2+XM4pNRT1mVfB7dVor8H6j/wgzQ6egvDkXaSb5fA5Dbd6Sh4kBBRhHHAj0RZX36xJ8vyCS3+90
	ChUDA4Ge3vID6jgQCB+SmK+Un77Z+znEmx8BfF+FOAMeSMrrsM8LA/SFylLC0Ak8qJoCaLR0j41
	HaUOJ1vOSwxBy30Erz+Ott+xIE49A5yTDh2Za0LI+vpJykdIWxgAKjT2YBG
X-Received: by 2002:a17:907:36c8:b0:aa6:4494:e354 with SMTP id a640c23a62f3a-ab2abc92570mr698464966b.42.1736429900053;
        Thu, 09 Jan 2025 05:38:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGidjwN/yFK9ZauIimr2u7AiwN7b2XDO8B6ecoGAlxpK3GFkQSMXGdYvA9XVkfNkK6maNXm2Q==
X-Received: by 2002:a17:907:36c8:b0:aa6:4494:e354 with SMTP id a640c23a62f3a-ab2abc92570mr698462166b.42.1736429899595;
        Thu, 09 Jan 2025 05:38:19 -0800 (PST)
Received: from [192.168.10.47] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a5277sm591739a12.80.2025.01.09.05.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:38:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: oliver.upton@linux.dev,
	Will Deacon <will@kernel.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev
Subject: [PATCH 0/5] KVM: e500: map readonly host pages for read, and cleanup
Date: Thu,  9 Jan 2025 14:38:12 +0100
Message-ID: <20250109133817.314401-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uN1SUVtklgrqbdRgsnLeo8jDXClhHtgcSA0rnMLFGr0_1736429900
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

[Oliver/Will/Anup/Andrew, you're Cc'd because of an observation below
 on VM_PFNMAP mappings. - Paolo]

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

The series is compile-tested only.  Christian, please test
this as we do not have e500 hardware readily availabe.

Thanks,

Paolo

Supersedes: <20250101064928.389504-1-pbonzini@redhat.com>

Paolo Bonzini (5):
  KVM: e500: retry if no memslot is found
  KVM: e500: use shadow TLB entry as witness for writability
  KVM: e500: track host-writability of pages
  KVM: e500: map readonly host pages for read
  KVM: e500: perform hugepage check after looking up the PFN

 arch/powerpc/kvm/e500.h          |   2 +
 arch/powerpc/kvm/e500_mmu_host.c | 202 +++++++++++++------------------
 2 files changed, 89 insertions(+), 115 deletions(-)

-- 
2.47.1

