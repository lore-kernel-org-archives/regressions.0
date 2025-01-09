Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D242206BC
	for <regressions@lists.linux.dev>; Thu,  9 Jan 2025 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429913; cv=none; b=CLbJ8PRiDAL0Te2BTHK9WcuwCv8xKHc5gTpZ6i5XEAmRaQBTAjNskyJwHwvQCb+68ns1JJKAGr9bxQPYLafkK5W/1fyg/k5NJK8wZ14c0wkbA/KWCnKx6j1aCCzMQDqRw2P1y9Xl+NhNah88cweIdK5HuRsYkRPCPdjCSPKQUxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429913; c=relaxed/simple;
	bh=sE3kc+9sHBVpfMHODBVRzxlEUWaM8pbPMewDEM8p2rI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=fz1rxYQhJLkxh5V2oWCquGrjHIk4VpdhhP8bzpE6U93aW86toNqzwxOq5JTnTDTaO5na06ha9H4XyycFOpqdtmtngHyo0VaT1uaguf1VAvWNHRmxMNjGV8Mb9cyGegKSubdBgxXO8EbPlMKEdXn7zzAszQ6x7Bfed1Epn0whDC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WQXP3Z4q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WQXP3Z4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zguszej+6js0jv121He/RU1+H3xrJy3UeZApbWTSTbc=;
	b=WQXP3Z4qnt9M/Y7jlwzRTQlhY6y7FrOy3KIXd8hX+DW980B5nrMNsySY32fMhJMy/EOY9y
	L3z158JTqvYn7hhIiNcyxYNfz73vwCFCBbv8iO50uuhR4nfwlg6U7xyOxAQ3WDbLw7litu
	F5R3XKg4/s7JIi+NQQ0EFFj7ZgtkhAA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-4sFas9TnMeidfzBIkLKnVg-1; Thu, 09 Jan 2025 08:38:29 -0500
X-MC-Unique: 4sFas9TnMeidfzBIkLKnVg-1
X-Mimecast-MFC-AGG-ID: 4sFas9TnMeidfzBIkLKnVg
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aafc90962ffso95561766b.0
        for <regressions@lists.linux.dev>; Thu, 09 Jan 2025 05:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736429909; x=1737034709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zguszej+6js0jv121He/RU1+H3xrJy3UeZApbWTSTbc=;
        b=QT7zaoqR7mx20XUDYa/TEAuyWfpVFAi+KdP4HzlW/EWnn8K3gFSkFEgTXhTUFny6EE
         YZVVjkC3hV3kVqVdhU88n+kXUqa4lyjHJfw857BGTA3g+oAdhBJGzocaHjFHTgtxTBzD
         M/l6eMsQDKkzmkdZvY2Jzah6kpZ2AzoWHo4ZwP5F06UrPseZ46nZmleKt2HpjKR7ndHh
         JyQCDZhzkWB3MXzcESITxWlTDrfCp5PlE0dhU4qXLpX4E1ZYEMijOaIZrYedJ3XMp7Yy
         eAHdtQ/Pd/HiUzCviWQGVmQC7kpZlVW5rlJNOUPAMcnurQxSYSAoZobQd0ijcCcGAqjb
         dRpA==
X-Forwarded-Encrypted: i=1; AJvYcCU6ZYxN39Udozu2ukhJ0CQk/UOt5au3syCx9W82MWCz6rlVS+iQpSSZ843/vQbF7rYyS0LO9pbVRSRibw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQzt2Iz51HYbyTa7m+rFRYbENQhCaVZoN3YZ8TE5HJqUQVVssT
	hfNbuBh744FNznSlsy6cJleb9sjbkMBzgRhVcNSHjjiy5aVM7IQo4E+aM17IEYqWQDyJ+lu8Wvk
	+mk6YHGy1w89ZhVKAFBMDThs8WGxKvn6pEteIzO7nPRgFLOllg9zaQFtl4Hbi
X-Gm-Gg: ASbGncvg0tBwDYWiQTeyZFt1Hk6S+Hz4UPgtSTHW54r3nCC+PMs+2Yw/9/RXWnmPQ8s
	Ng+tHBLbsmM7cchxwAfgO0PblvQZaJHCAI4VENg+bhq2HXPC/PE3kI0h3bG6m+yAujjWOuyYlmm
	5I7Zq5mNBFifeJ6vq3Aiv3sDbvuWehPSoCDybVU/aEqJmSQLMI2YaMjDe6xtM53QMNv/FscpnKb
	WS6CY+eKMuAeFnHtyV9BoTjGQ1t97XXhO5GV/V/flBAEvdbu6FvHumd0ZIo
X-Received: by 2002:a17:907:724b:b0:aa6:abb2:be12 with SMTP id a640c23a62f3a-ab2abc91b53mr573667966b.37.1736429908688;
        Thu, 09 Jan 2025 05:38:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGo9tyQhMRCjTpqjQKY5ONk4yRTr2KDDRMNsirKe/0lHnxJJpvXbaOhKUZHyIFh2cUX8sdNHg==
X-Received: by 2002:a17:907:724b:b0:aa6:abb2:be12 with SMTP id a640c23a62f3a-ab2abc91b53mr573664766b.37.1736429908325;
        Thu, 09 Jan 2025 05:38:28 -0800 (PST)
Received: from [192.168.10.47] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95af187sm73137566b.142.2025.01.09.05.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:38:27 -0800 (PST)
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
Subject: [PATCH 3/5] KVM: e500: track host-writability of pages
Date: Thu,  9 Jan 2025 14:38:15 +0100
Message-ID: <20250109133817.314401-4-pbonzini@redhat.com>
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
X-Mimecast-MFC-PROC-ID: gMJPp8wVrX6-G0osNrrhWrCwoitwX-fUVdirbEMRjoI_1736429909
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
index 06e23c625be0..e332a10fff00 100644
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
@@ -492,7 +499,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 		}
 	}
 
-	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
+	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg, true);
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
 	writable = tlbe_is_writable(stlbe);
-- 
2.47.1

