Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DCD221DBB
	for <regressions@lists.linux.dev>; Thu,  9 Jan 2025 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429916; cv=none; b=CxFWALfR8vQ2GUPsRGTmj+GhQHxQHH7h1om2RpiyY/UXt/0AxPf/A4A1Jske4p9Z13G/M+aZ9enj0LwmRUPI0i4wKXyUokls54IpFPLuqjt2IFR5YXScjA2NawYn6ax1xUZykvXY0g3Otr0dipEQnRaZQPM/GyJxAwbGPQ7jNLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429916; c=relaxed/simple;
	bh=iNT9KPtrkMdcv/JnCsg0+6j7kTEB+dZG7xYjFTS5aX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=MkW99KSuN7dz+JhGSf58QQlgpqbdOGlLH+GeWHaNh0te+9FcOM99M+JR53FraGi7BGPcTt7zFbh5q9CIWq7/L27bW2H3fHX0vNbTb5DqITnHRPC7z5DUpIAMc9KnUHjiExS4TDDgetPEB1u2gM3YBHkRYCEhzfgT7965yx8lDR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GbET+wd6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GbET+wd6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4qkNvDxtryDJuaOhZabXXDqOZ28SJd16eOJBotltio=;
	b=GbET+wd662WK2OOQtuWHKrHvTSadvospFo1dz1E1Kt88HOCLJDWdaMvBMtJN4MmAi1Culs
	EJHO80VU0q6yDeinhqj6RQtPGFpqhHVlhqksXoJvLpfts8e1vKABCnLUp4WCxmP7TKv6FH
	m632VBO78TeCmrkwAw8WExPPD4ENfKo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-OkJN1mDFMtKa09xjSephFw-1; Thu, 09 Jan 2025 08:38:32 -0500
X-MC-Unique: OkJN1mDFMtKa09xjSephFw-1
X-Mimecast-MFC-AGG-ID: OkJN1mDFMtKa09xjSephFw
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa67f18cb95so91681766b.1
        for <regressions@lists.linux.dev>; Thu, 09 Jan 2025 05:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736429911; x=1737034711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4qkNvDxtryDJuaOhZabXXDqOZ28SJd16eOJBotltio=;
        b=sqhJejlNb5PeLr1ZjGdmVKswpP8a4anmxfNG32wGAB+wTWyayXMH6as6zw3XpqMYZg
         Ha5wa7lEW435uE59dABsBsIokbqzfMsT4iRCLuh+YsxpDQQ0/MZd8iuOI/jzoJAmIjBN
         x2mdi4Gcpnh0Ye62bUoqr6qRHQS61WAuQ+fYP+35rYod55dRKbyObyAtt+0C24XrUpi5
         VGMo+dbV2DaFCizIw5OGGG/u6th1R1T9VapPXtENlDkSjhyvPgZxbZ9JKalDHdGRH6A7
         lX+XlBoYCrN0+Kg/BZtdCE0umoa4lUaeceDpH/Bp4HtMrqbWHtmYsJDEUuo+W8I4d6EE
         CH9g==
X-Forwarded-Encrypted: i=1; AJvYcCV7GzkQIz9/+nMqPMEaOALGZVhhhQWDCOoCIyKbBvaLtbb9zNBYFX5ySh33sJNP4FlEqqKWnLwoF7GIBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YweUhQ3q5nBv4MTnimL4VDFpBZfVAj0LlucYK9/zXwgDegviAZc
	g3CZ3+LjgkYqFDrbj5CLGzVIZE8obNsQyp1aLuIEnEIOfQMkfUymVT8EA4vtIrhznmJc+5RiB8K
	uIB4SzPiIC3UjJfhVsaXrdzoXA0ry7SbbLz40GXOnqulI+Eb5/Vlj7UAvLJU3
X-Gm-Gg: ASbGnctAMVN1WQcs/mNYs1dqWEOmLXPK2ChdeQsm7UnpYate3rQ19/2yCv79mtGRTHt
	vxH6aEHZljsOZpdPBu1Ww+0Sb4lYDR1YnWURnfQCzfW38mv2F1546PcKvN6BU2VJx/EXUsCP2yY
	gXIlOFTW61j8JmqLeSTHCo2ErteGMqG7JILUWxR2VbkauBFUwExLLrQJ+mIqEIJl138KXS4qxNd
	Majxu37sf/a4roTZWsF29WbHsJnLhHA/iAMuc1ziK/XbUAo2ygI0gg9Fafw
X-Received: by 2002:a17:907:97c6:b0:aaf:208:fd3f with SMTP id a640c23a62f3a-ab2ab558911mr610031666b.13.1736429911049;
        Thu, 09 Jan 2025 05:38:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcNnAC+O5NQsf3e6ZbNH5VgDVjtZpeWPQB3s6uy9MQKvp52Beiu2u+bl2BWL3zXg+RcIfN2Q==
X-Received: by 2002:a17:907:97c6:b0:aaf:208:fd3f with SMTP id a640c23a62f3a-ab2ab558911mr610029466b.13.1736429910681;
        Thu, 09 Jan 2025 05:38:30 -0800 (PST)
Received: from [192.168.10.47] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90d6838sm74386766b.55.2025.01.09.05.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:38:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: oliver.upton@linux.dev,
	Will Deacon <will@kernel.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev,
	Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PATCH 4/5] KVM: e500: map readonly host pages for read
Date: Thu,  9 Jan 2025 14:38:16 +0100
Message-ID: <20250109133817.314401-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109133817.314401-1-pbonzini@redhat.com>
References: <20250109133817.314401-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jpXVPoHmVecMixcewml1cimAGWuln5zZ9yA5qrBAqJM_1736429911
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The new __kvm_faultin_pfn() function is upset by the fact that e500 KVM
ignores host page permissions - __kvm_faultin requires a "writable"
outgoing argument, but e500 KVM is nonchalantly passing NULL.

If the host page permissions do not include writability, the shadow
TLB entry is forcibly mapped read-only.

Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index e332a10fff00..7752b7f24c51 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -379,6 +379,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 			unsigned long slot_start, slot_end;
 
 			pfnmap = 1;
+			writable = vma->vm_flags & VM_WRITE;
 
 			start = vma->vm_pgoff;
 			end = start +
@@ -454,7 +455,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 
 	if (likely(!pfnmap)) {
 		tsize_pages = 1UL << (tsize + 10 - PAGE_SHIFT);
-		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
+		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &page);
 		if (is_error_noslot_pfn(pfn)) {
 			if (printk_ratelimit())
 				pr_err("%s: real page not found for gfn %lx\n",
@@ -499,7 +500,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 		}
 	}
 
-	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg, true);
+	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg, writable);
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
 	writable = tlbe_is_writable(stlbe);
-- 
2.47.1

