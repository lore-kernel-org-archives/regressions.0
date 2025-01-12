Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D331319CC0A
	for <regressions@lists.linux.dev>; Sun, 12 Jan 2025 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736675748; cv=none; b=IX/9VkzOnRAJnUzrlLfXPvla5dK+9jsNbb6roYOyr5cOCEyRwE63mVkv6TSHMZ1rdqf21ww7X+/+wKFOY3644m0ks4wWEMSAyBjExlyQGiS42xQ2hYpoSnlrPicgi4aCRklV9uxv0eek1RCAFJb8sGLQwXn06JSUTKlF6AhRVRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736675748; c=relaxed/simple;
	bh=2SDn49FT0scN9brUsaT1uzAqhvETvcU7A9zYxcIRZEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=V3Wgm+7gFfup/QMN3Z667CkSJ1owvZyXjpu5EjURnn0kg2wzbc8Dt7c2eLB506FwoRHV2fvlhy0nbx+BgojtkyhvkzIprERN/OAAc0BKnscGy1egoyMCM1zYlrVfDi8LqgMDncBJvgT18FgeIG3GuhTbhBWNu/rdt4ntNH8YRqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H/+eWlpA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H/+eWlpA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=53tOW+li8LibaZME0FEdug9t3b3VYRiHfAOklFpMuVY=;
	b=H/+eWlpAQGoYDUwAF4gsA/ZtKsIplKECx7B58cNhFF4oUZWw5d7L5me/LiKRuk5XMQ3BbS
	jbTd72JU89IJL2mEcNPQ41ekWwBWZytUuwThL/1WbFvB8bn6K2CguQz+8YZ3fC8q3+lO4O
	BpAfD3XvzWeNJvHOSf5y4kVKSEhFkJQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-AtxqqbPNOca3RwLJahMWdg-1; Sun, 12 Jan 2025 04:55:44 -0500
X-MC-Unique: AtxqqbPNOca3RwLJahMWdg-1
X-Mimecast-MFC-AGG-ID: AtxqqbPNOca3RwLJahMWdg
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ab2e529dc35so212278966b.3
        for <regressions@lists.linux.dev>; Sun, 12 Jan 2025 01:55:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736675743; x=1737280543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53tOW+li8LibaZME0FEdug9t3b3VYRiHfAOklFpMuVY=;
        b=rd2yeD5hr5fMU7ZTPFg443BorciTMFW3DLE5HB3RHFIQQRDpZsFAN/l2TsaDNlzeur
         c7IceBIhUDBOU/v+UdP3TtTWUOdxJ7l9jDovPUiCy+5mEsFitNP8D2FimLwDgrsnE4q+
         YpXwwuM5CFo91YoG74AzHB49XNhHMAFL3T2iLUWxkYIPGqZeibbW5gCcDCklqddZfCvR
         1reGJH2tBed6XIFUwvcCQQYQQj9fvDwrYAiaR0KoJKaZuSkm9pKI00LzIH/tKWPN3J1N
         Mq7Dde+KJbXQULuxFm1ZSOkL6QKTjsCGhrOWM8zwvrAXo4xaKQ+tWLbgvPivUXKpeRua
         BCBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtWuUf4GrBE5DKhn2kRMTEIcCG4QDR7UEfSDa9927Ph0bJUkqQJZrGGbleV55I3/aYZ4EMhrYMq++XgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3IcWmWmTMGGYyOjhcMVHnui5K15er9yD3LfHYaFeaLGZ+RPtP
	hV8vu0YureVump8XcidkZbwNl24J8WHyue+119k9OrgXyewVSm7BSleTwQwWWQLGkfgh5ofgLUV
	0sy2rIEjhNUvYXdmW3/ct3/rTrG2pdfoVAycEYbopRGFsOrR8lsBmgS+G0pm0
X-Gm-Gg: ASbGncsKRaFBdAhBX3a5HKxSrW3kw3wxctkIi8uTOD8dkTMyfGSB+YL1DwGF/YmAvDq
	cc8Q/2vskzfj2CJCNZ6UvGTTu1RVuU4FspA+A3jLaV7Vc1vwKF0MxmJo8gxVpfb7lzi1VazypIx
	iLAOaLooJur8d20vrBGQA5YukdNDIQaEV/N49W+oxJxE/3LpmZRJ0TEQz8s7PVu8sSIxINVM5NA
	zj8gqZd8h9roemcqEyX4tFUlVBbISOX+Nb3Hbz8nLm6qHUyCtHTG3UHmFU=
X-Received: by 2002:a17:907:7f1e:b0:aab:c78c:a7ed with SMTP id a640c23a62f3a-ab2abde30a8mr1561037466b.49.1736675742911;
        Sun, 12 Jan 2025 01:55:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGJlu2i7msf3zvSzymzm23VI3HB+hujDx3jJa79Xm9BhmbLM60jNLT6BqjxStf0JBpA+edAQ==
X-Received: by 2002:a17:907:7f1e:b0:aab:c78c:a7ed with SMTP id a640c23a62f3a-ab2abde30a8mr1561036366b.49.1736675742572;
        Sun, 12 Jan 2025 01:55:42 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905e2ebsm363088866b.10.2025.01.12.01.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 01:55:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev,
	Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PATCH 4/5] KVM: e500: map readonly host pages for read
Date: Sun, 12 Jan 2025 10:55:26 +0100
Message-ID: <20250112095527.434998-5-pbonzini@redhat.com>
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
X-Mimecast-MFC-PROC-ID: AY8U2Oko0hBoGZkZbauWnH17gyjmJ0bTMn0JYc-P-7Q_1736675743
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The new __kvm_faultin_pfn() function is upset by the fact that e500 KVM
ignores host page permissions - __kvm_faultin requires a "writable"
outgoing argument, but e500 KVM is nonchalantly passing NULL.

If the host page permissions do not include writability, the shadow
TLB entry is forcibly mapped read-only.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index b1be39639d4a..b38679e5821b 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -374,6 +374,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 			unsigned long slot_start, slot_end;
 
 			pfnmap = 1;
+			writable = vma->vm_flags & VM_WRITE;
 
 			start = vma->vm_pgoff;
 			end = start +
@@ -449,7 +450,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 
 	if (likely(!pfnmap)) {
 		tsize_pages = 1UL << (tsize + 10 - PAGE_SHIFT);
-		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
+		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &page);
 		if (is_error_noslot_pfn(pfn)) {
 			if (printk_ratelimit())
 				pr_err("%s: real page not found for gfn %lx\n",
@@ -494,7 +495,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	}
 	local_irq_restore(flags);
 
-	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg, true);
+	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg, writable);
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
 	writable = tlbe_is_writable(stlbe);
-- 
2.47.1

