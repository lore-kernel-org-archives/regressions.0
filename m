Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970222206B0
	for <regressions@lists.linux.dev>; Thu,  9 Jan 2025 13:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429911; cv=none; b=VreVSYqZDRwSGgJ1tThGDU0zvXNY9hzolGeDrzNOBNnfzhwm2i8eyQC0Z23kuvacsoP3Ebk6IhAwZF+LWQYXDVnm6F10jD5vdkqj4Nigq2n8v3Sp6CLvUl9Q8dVIOxU7YODtxOYU1oqJCy3pmDtcbkXoq2+4OjDL7NjFnmCKHhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429911; c=relaxed/simple;
	bh=CLPtAWyQrS2entG2WH31BYmUD0uC+KITDZ/IYJGu0jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=qnrkNcTZFYPrgfclqeZW1Rp4PJpqxgQRxYnazoWf5dDIyjq7gn/N/4cNgaOjtBXcV0i62PovPKsipUrYIfxhXXUpAZbxXRgYbXBSg0CB53JnI3gjxUmXN53WVjdglvDh+vbxu6jgkinOOmoZB4eAiVH1DqHyRwiq7MbofGgRxDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PCp7uBfJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PCp7uBfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d/K9YNVS7ltWEgnQj5oYbH5hWmhcl5BqPq+/x8nLjmU=;
	b=PCp7uBfJ9YTZNgzPiqD6ghIY3gKdbwCfJqIBf1sfw3po9sQAHP9OC5+3LczZ5rQoPpzdbG
	h31E4eDysYTqGYF3t2szbeL3jpAfKFOxCQgb93iP0TqpuuCzNl0sR6wo5C0/uLXW5Om6XL
	kzf3CSZBcfVQyBEJPQymrL1fj9whZuA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-f0xhXq3nPSeEAnQe3b9XCA-1; Thu, 09 Jan 2025 08:38:27 -0500
X-MC-Unique: f0xhXq3nPSeEAnQe3b9XCA-1
X-Mimecast-MFC-AGG-ID: f0xhXq3nPSeEAnQe3b9XCA
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa68952272bso104195266b.2
        for <regressions@lists.linux.dev>; Thu, 09 Jan 2025 05:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736429906; x=1737034706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/K9YNVS7ltWEgnQj5oYbH5hWmhcl5BqPq+/x8nLjmU=;
        b=FIDwNuW3lwbXq8x4Emkav9NgDqpP2B4qK63AhW9b7DWy6sLiLGzxeI9Zm2d6FxHY+q
         FD4a5sCipfsUPRfthZ5EpRDlgJ9iY7Sl9uK89h6WvIz96hMJIsF8XruA8L4VcXw2bxQ6
         XX9EdFzp9RQJTmzv7pXKxREir7U0gc2t2a/Xo46tUc1KmG8p6qAopyrP2fgqfcHi/9Pi
         VADhXeBZayiZtKP6J5chyqbM0YBwqBdnHCA5wHmQ/ZIJl9Ff9iR3mUS4Qrx1xL+RrEGD
         h7frRwdtGoC07VyqfQeGE+eFRVYxYHqZK2ZD5/iYvpJ54Ur/rXZ7Zkybv0STbIrjpwI0
         uC5g==
X-Forwarded-Encrypted: i=1; AJvYcCUBE1ws6mF2KY2o42fy3T5KOIF6f2NaoRfRjLQW0a6PATQIFY5trMbDtIm6qXs9L2Jjo/r7n1fSMahx5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YziOvYxi5PUWMVGjjfR/QZFYG39lMf+LzkwDd/xzyF0DZwBxs6W
	59W9IIL58N0/uVy7kCibnjZ8s7VPpODRFzZpraPo30IyaeaOANKYTvx67iacNZHCuHnlMjfYUMz
	M9wr1PK/uRjE2fm4Fs0yrdXGghNDqEurJeEL/fnAfz2DYTWclD3BfP/mWmj0a2bzdlDoGV4Y=
X-Gm-Gg: ASbGncsd3rHmnQ37QEqfXT0GSxPLtU/VxeCkwYcwmpfNUzNDepk1axtZ1uTMieKcjrl
	3+cPL5WojFu1T8EOB5v5sC+c1n87jzB5e6uNgEQ988Kw5h7ajamfkM8Z4YccwTkP0+t4eEUL/mm
	7Y+++37BmPhaoGqKOyTqcAb7CgrFPiJrQ2XbqxjL1bQkNA+FxJQlK+X7lAzs3KYdmD2yjc8/MLz
	DHu5N5//FelNjdbZjM7mnS5NzX/7COH6bW2N4NxXX6VgWyUNWahDny1qI0J
X-Received: by 2002:a17:907:94cc:b0:aa6:7cae:dba7 with SMTP id a640c23a62f3a-ab2ab6a851amr624677666b.4.1736429906037;
        Thu, 09 Jan 2025 05:38:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTbBeYDIBQ3z954w6dfAEk3XY9Iu9HEUTdIMdZmv3AtPH2uw4HEV5T8fdkL1pcscV4BnFyug==
X-Received: by 2002:a17:907:94cc:b0:aa6:7cae:dba7 with SMTP id a640c23a62f3a-ab2ab6a851amr624675766b.4.1736429905640;
        Thu, 09 Jan 2025 05:38:25 -0800 (PST)
Received: from [192.168.10.47] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95648e7sm72802566b.95.2025.01.09.05.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:38:23 -0800 (PST)
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
Subject: [PATCH 2/5] KVM: e500: use shadow TLB entry as witness for writability
Date: Thu,  9 Jan 2025 14:38:14 +0100
Message-ID: <20250109133817.314401-3-pbonzini@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 0eWxTy_AUl8LgrKXyE6BeS46TC0-3sGXfXbb5YNCIPk_1736429906
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

kvmppc_e500_ref_setup is returning whether the guest TLB entry is writable,
which is than passed to kvm_release_faultin_page.  This makes little sense
for two reasons: first, because the function sets up the private data for
the page and the return value feels like it has been bolted on the side;
second, because what really matters is whether the _shadow_ TLB entry is
writable.  If it is not writable, the page can be released as non-dirty.
Shift from using tlbe_is_writable(gtlbe) to doing the same check on
the shadow TLB entry.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index 732335444d68..06e23c625be0 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -242,7 +242,7 @@ static inline int tlbe_is_writable(struct kvm_book3e_206_tlb_entry *tlbe)
 	return tlbe->mas7_3 & (MAS3_SW|MAS3_UW);
 }
 
-static inline bool kvmppc_e500_ref_setup(struct tlbe_ref *ref,
+static inline void kvmppc_e500_ref_setup(struct tlbe_ref *ref,
 					 struct kvm_book3e_206_tlb_entry *gtlbe,
 					 kvm_pfn_t pfn, unsigned int wimg)
 {
@@ -251,8 +251,6 @@ static inline bool kvmppc_e500_ref_setup(struct tlbe_ref *ref,
 
 	/* Use guest supplied MAS2_G and MAS2_E */
 	ref->flags |= (gtlbe->mas2 & MAS2_ATTRIB_MASK) | wimg;
-
-	return tlbe_is_writable(gtlbe);
 }
 
 static inline void kvmppc_e500_ref_release(struct tlbe_ref *ref)
@@ -493,10 +491,11 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 			goto out;
 		}
 	}
-	writable = kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
 
+	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
+	writable = tlbe_is_writable(stlbe);
 
 	/* Clear i-cache for new pages */
 	kvmppc_mmu_flush_icache(pfn);
-- 
2.47.1

