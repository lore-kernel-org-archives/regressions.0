Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BEE19F12A
	for <regressions@lists.linux.dev>; Sun, 12 Jan 2025 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736675740; cv=none; b=KDy5fRc2WOS0wwMmTOzFlM8bRXzWSnHbe2xc6rBj2mWPNfpexlwaQngXMHGzdOWuj2J6kAtWntjCF+h7G0uI5gr+z7gIafq5UODz4YPlbz7ZdpQCkAWrs/rLkf5DasLpas0tHBm5NMgh7qKcpV0UdV4q+gOCdnBLN45aYfAAT4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736675740; c=relaxed/simple;
	bh=zXt8gel/yANsANDIs5B5Mdvh1QFGb9YfZgkI8pbrooQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Jy7EDhJsBQTIPwPpamL8k7emBFi7Q50ZkHwlZwJYGFvOgmHf0QlLU5CVugAZ4NxxGW0vfMxlbYgeKo5DKxVxoq4TDgtUCDnuCUvkh8EmxzVXTMA6nWloQ3n/Ai/h8Bqx21RufmqHn9sh6VV5yQLCkHF8Zo7zcxRNlGo/OUnpsII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b59rLUPx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b59rLUPx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q2g0sdh+W5glSkagx457PsA9cI+PMduPyER5qBCP9uo=;
	b=b59rLUPxxTDQrPM+zZp7hlJFf23J5sXU8LWQl/zUQ6osUo8ooRY4BCu670C+QRUFXPDI5W
	rHGJGD/e+6DuYbIlDXuH280+l95rcwTAvE4sRHLQT2eIPIEoMNCH8LsIqvkNdVAFrtB1RY
	azGxS7D058Nbxh2sZGJ/eB1IFuo+YOA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-8zyesE2XNgamy0LrWoPo5w-1; Sun, 12 Jan 2025 04:55:34 -0500
X-MC-Unique: 8zyesE2XNgamy0LrWoPo5w-1
X-Mimecast-MFC-AGG-ID: 8zyesE2XNgamy0LrWoPo5w
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa683e90dd3so271385066b.3
        for <regressions@lists.linux.dev>; Sun, 12 Jan 2025 01:55:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736675733; x=1737280533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2g0sdh+W5glSkagx457PsA9cI+PMduPyER5qBCP9uo=;
        b=KqxYjfqkFYL/b/8t5qIV24BOFcPqhEv3G57cYY/U7ddpkbGL465Ygskb98+jq3Q3ch
         98SJUAqN6Z/OBZpj1IoQ1i1vSe7zL1hu5JKzLtf2vIq7EITlAMQ6QSnRc4jE9ixIwQrr
         iCzeAngQIj2Chh7Gxu959aK9vC11w5k79FVQoL7R/ihkYkUW0GboGQw3qyJ1kN53AJoh
         QDDVsJRGt+Q0YaFdA+s4Kk48MkSxX4WKi8ZrecAQV6ieVf4zzyO46sktLUYU+lm1clVv
         kuZv/+5rb1uuMwOoTyRWLaHBMNB+X02XVE2Z8CO5wKi0pNo5e501bw8bxW/3pVP0Lkix
         targ==
X-Forwarded-Encrypted: i=1; AJvYcCUBsYIDsRtP3Z5OsSTlPYchbXH7BUynw8FTxY2ZaGEEhrCuSzXRVBzjvVdZPkRS68fYcxmM/yduXFMd/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAVNAaxc0P++FNgvqRml2V3cSg9Kr8EKmfGRsSc7G/eQZByRT1
	q2HxSrp3h+11JCdC1weFGuv8vPuJHMvDUas7tbMBJs3fV+bpbnAaRcNaOWYv916gKcE3D44djXV
	b4iv03Y4amplSWob67bHNNoxN/+bciWDG5t7hl7MBLNlAqmhRTqxmnrYnYjw9
X-Gm-Gg: ASbGncvbRM+Ee6t3WhpXr73aFJiluBiuarPmzA5f+hSNJfLhpEZuoTSq2vyTJMXqYEm
	bze17b3fTnyOVxMDpEPnwTofmPWEkaqzUNmEte6KOg+OXH+12YP+Fst4HspNQWM+N+kGU/ZEpr9
	NrAdXTau5bF/YdV1fZieHRyQV98KMQzogG+2Dr2+qjIJn+NVMyzwVXwAOuIXsb9eCXKvmZiW7Gm
	Ic3cyw1uXHInVV5/bLE6OFeNQZYr89g7fVBzcykgB/GHb4CUZG586APbsw=
X-Received: by 2002:a17:907:d1b:b0:aac:23f4:f971 with SMTP id a640c23a62f3a-ab2ab70a173mr1753854566b.33.1736675733514;
        Sun, 12 Jan 2025 01:55:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxwq3cSzmX3Sr/t/JxywDCCAqRMgXJsypEs7qUCiLJx2f+d/bQof+BQSWZDWOMCFQMp6aY9A==
X-Received: by 2002:a17:907:d1b:b0:aac:23f4:f971 with SMTP id a640c23a62f3a-ab2ab70a173mr1753853166b.33.1736675733170;
        Sun, 12 Jan 2025 01:55:33 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95647absm352956366b.118.2025.01.12.01.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 01:55:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	stable@vger.kernel.org
Subject: [PATCH 1/5] KVM: e500: always restore irqs
Date: Sun, 12 Jan 2025 10:55:23 +0100
Message-ID: <20250112095527.434998-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250112095527.434998-1-pbonzini@redhat.com>
References: <20250112095527.434998-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4wyCu5zL5Tsxq-jJuCCuOv2iZym6QX7ixLcGRrtRfuM_1736675733
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

If find_linux_pte fails, IRQs will not be restored.  This is unlikely
to happen in practice since it would have been reported as hanging
hosts, but it should of course be fixed anyway.

Cc: stable@vger.kernel.org
Reported-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index e5a145b578a4..6824e8139801 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -479,7 +479,6 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 		if (pte_present(pte)) {
 			wimg = (pte_val(pte) >> PTE_WIMGE_SHIFT) &
 				MAS2_WIMGE_MASK;
-			local_irq_restore(flags);
 		} else {
 			local_irq_restore(flags);
 			pr_err_ratelimited("%s: pte not present: gfn %lx,pfn %lx\n",
@@ -488,8 +487,9 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 			goto out;
 		}
 	}
+	local_irq_restore(flags);
+
 	writable = kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
-
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
 
-- 
2.47.1

