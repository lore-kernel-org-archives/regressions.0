Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FED01AC884
	for <regressions@lists.linux.dev>; Sun, 12 Jan 2025 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736675745; cv=none; b=tBBymWt9mf9Q5vCZALZ0tfT1wtbr1EmIfVusbPI0qiyrNllzoea3rPuYk7xmUQEY2uyDtSlSvG0twtMOF1G9j3sE6PJ5ihBdqepp6RieZpl9heDTyUCbSr4d/su1TCUf5ruyOFqIcQMFV7KSzidlRt07FaxVPqLtWGQUrcN1MM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736675745; c=relaxed/simple;
	bh=PYlVa2Y/YXHDakzTrdegPPAivF2UKPgqtms42a4RRMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=QIj1M/2ydofm38MqUsOIlVjir14rUm02bFBcqVy889AkgpQzqfCEfroZnSWnBxaPzYd1JATBSISppyjAYihSIC48anchN5ZPf7jsoWA0KkFP/g2+Tnvr8q084YqGB3hPjVym19HFM4zW2FjeNauiBFp6KpAz6zHNetGqQ7OWOjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d5EumcDR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d5EumcDR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZOi2vhUk9IqOWLL4VjvE3yvErD9voRzbqxDd4bb0e4=;
	b=d5EumcDRbU9ib9Y/yVrZ7BKRoSsd7mJEDltvEq7l6XBiV6o7MXj+BvLCbkWQK0k8WEClKi
	GXDdZFVE4LiGjHzAHxn2Wo9nB2qRI/NJqjwSB2wCcmW4KLGGZhz/AKjEpv/KILICjIs7sc
	7xW5lBTFfsiYfY+SXaOVNoy6rPf05iY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-TQAnnt7DNniGIdwLK6PoHA-1; Sun, 12 Jan 2025 04:55:41 -0500
X-MC-Unique: TQAnnt7DNniGIdwLK6PoHA-1
X-Mimecast-MFC-AGG-ID: TQAnnt7DNniGIdwLK6PoHA
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aaf921b8a85so336461666b.0
        for <regressions@lists.linux.dev>; Sun, 12 Jan 2025 01:55:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736675740; x=1737280540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZOi2vhUk9IqOWLL4VjvE3yvErD9voRzbqxDd4bb0e4=;
        b=NRNcz6sD3sof3Am45k5N7Y44Uqj75Q7Ju73Pe4fQCkpxk1uF+egt3byX/pGmadrfvu
         WtsRLx11YCm+uiKN/hNqvVxAW7Lst1knvkI4epBzvQi0LUTXK7XAbmHbs+PWVYjwMIe/
         8sRclKOYvAaliWsJEYWG8vhgNjeEVZuSaH8yW0XS4ucsQhxJk/ieEHsW0uKVyQKI3DZk
         RC5+wV/UpKiYcpBYyhrMpVtm+Dsm3+ayv+JV4LWqJWm73vJfsyuUEB0CcdfJjsOu0+lh
         NbBxi572mvk8wRcdFDvbcyfrQSUmJ54V4QBNX4EvIdL1Z/fp6T2QBceZOecHfgzdHZkZ
         WGYw==
X-Forwarded-Encrypted: i=1; AJvYcCUEXxHQLKr7w2IwkVRs6StkDAaJp7vTxWJGrvWQyKSO3yxyekP6a6wJEMH+6ykT6SW8R/5EZS+VIaLnbg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzodein4c3ZuYRik/nQf6BV6up9TAozKPZh4HtRF8ATehL5C0oZ
	Hy00Px8NVmsbHrOyA8oC429MR3KTsvEswzOP/Sog077T0iVTFWNO4kIJTRpngmsv6eaw0uZE6Gj
	mNLaGaM5eZEacxXSXEI1IXbfiRd4oZm2hAlAxnl5tT1EJqPJg+Te7cnWHgqmd
X-Gm-Gg: ASbGncu81lRm3k6YzW7EGdafft/FIxhs9TBwODd1lf3NhwBoOxFLk6GIzTr6HAnCeG5
	CIJkuI0jB3zLQUcLXF46Q8jE+3vhSQbnlFamPoYY1moWp1Wotc/i1AoTdsi5959bnRgBKunmZ8f
	1tryofBp9fkjX96mUeXwxXRbJjydIKPUSeubUGVssTGDF44cqHxaa//FnpYNb8/Y/4PR9xveC7A
	tz6GtV+pLT8WvDByKHYpWthoeW1puLouORi92Znd5Y3x4heiQ+ABvUb1Dg=
X-Received: by 2002:a17:906:f58d:b0:aab:f014:fc9a with SMTP id a640c23a62f3a-ab2ab703f01mr1331418066b.22.1736675739786;
        Sun, 12 Jan 2025 01:55:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYiuGhI+4msFAOUKvZ179BJ3utaua0uWFviKs7CY/tGCvPWvPtqZvorhRWNQWYuMTsu6u8Aw==
X-Received: by 2002:a17:906:f58d:b0:aab:f014:fc9a with SMTP id a640c23a62f3a-ab2ab703f01mr1331416766b.22.1736675739453;
        Sun, 12 Jan 2025 01:55:39 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2e8c753fdsm226853266b.184.2025.01.12.01.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 01:55:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev,
	Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PATCH 3/5] KVM: e500: track host-writability of pages
Date: Sun, 12 Jan 2025 10:55:25 +0100
Message-ID: <20250112095527.434998-4-pbonzini@redhat.com>
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
X-Mimecast-MFC-PROC-ID: ZcspxPpr5eJptYRB3vblrx_z74NG77fxL4Pvrqd6Py4_1736675740
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add the possibility of marking a page so that the UW and SW bits are
force-cleared.  This is stored in the private info so that it persists
across multiple calls to kvmppc_e500_setup_stlbe.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/powerpc/kvm/e500.h          |  2 ++
 arch/powerpc/kvm/e500_mmu_host.c | 15 +++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/e500.h b/arch/powerpc/kvm/e500.h
index 6d0d329cbb35..f9acf866c709 100644
--- a/arch/powerpc/kvm/e500.h
+++ b/arch/powerpc/kvm/e500.h
@@ -34,6 +34,8 @@ enum vcpu_ftr {
 #define E500_TLB_BITMAP		(1 << 30)
 /* TLB1 entry is mapped by host TLB0 */
 #define E500_TLB_TLB0		(1 << 29)
+/* entry is writable on the host */
+#define E500_TLB_WRITABLE	(1 << 28)
 /* bits [6-5] MAS2_X1 and MAS2_X0 and [4-0] bits for WIMGE */
 #define E500_TLB_MAS2_ATTR	(0x7f)
 
diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index c266c02f120f..b1be39639d4a 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -45,11 +45,14 @@ static inline unsigned int tlb1_max_shadow_size(void)
 	return host_tlb_params[1].entries - tlbcam_index - 1;
 }
 
-static inline u32 e500_shadow_mas3_attrib(u32 mas3, int usermode)
+static inline u32 e500_shadow_mas3_attrib(u32 mas3, bool writable, int usermode)
 {
 	/* Mask off reserved bits. */
 	mas3 &= MAS3_ATTRIB_MASK;
 
+	if (!writable)
+		mas3 &= ~(MAS3_UW|MAS3_SW);
+
 #ifndef CONFIG_KVM_BOOKE_HV
 	if (!usermode) {
 		/* Guest is in supervisor mode,
@@ -244,10 +247,13 @@ static inline int tlbe_is_writable(struct kvm_book3e_206_tlb_entry *tlbe)
 
 static inline void kvmppc_e500_ref_setup(struct tlbe_ref *ref,
 					 struct kvm_book3e_206_tlb_entry *gtlbe,
-					 kvm_pfn_t pfn, unsigned int wimg)
+					 kvm_pfn_t pfn, unsigned int wimg,
+					 bool writable)
 {
 	ref->pfn = pfn;
 	ref->flags = E500_TLB_VALID;
+	if (writable)
+		ref->flags |= E500_TLB_WRITABLE;
 
 	/* Use guest supplied MAS2_G and MAS2_E */
 	ref->flags |= (gtlbe->mas2 & MAS2_ATTRIB_MASK) | wimg;
@@ -303,6 +309,7 @@ static void kvmppc_e500_setup_stlbe(
 {
 	kvm_pfn_t pfn = ref->pfn;
 	u32 pr = vcpu->arch.shared->msr & MSR_PR;
+	bool writable = !!(ref->flags & E500_TLB_WRITABLE);
 
 	BUG_ON(!(ref->flags & E500_TLB_VALID));
 
@@ -310,7 +317,7 @@ static void kvmppc_e500_setup_stlbe(
 	stlbe->mas1 = MAS1_TSIZE(tsize) | get_tlb_sts(gtlbe) | MAS1_VALID;
 	stlbe->mas2 = (gvaddr & MAS2_EPN) | (ref->flags & E500_TLB_MAS2_ATTR);
 	stlbe->mas7_3 = ((u64)pfn << PAGE_SHIFT) |
-			e500_shadow_mas3_attrib(gtlbe->mas7_3, pr);
+			e500_shadow_mas3_attrib(gtlbe->mas7_3, writable, pr);
 }
 
 static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
@@ -487,7 +494,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	}
 	local_irq_restore(flags);
 
-	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
+	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg, true);
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
 	writable = tlbe_is_writable(stlbe);
-- 
2.47.1

