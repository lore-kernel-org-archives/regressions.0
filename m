Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D00D22069B
	for <regressions@lists.linux.dev>; Thu,  9 Jan 2025 13:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429912; cv=none; b=SajUJgb/Ez0xc99kuIF3nEGRXW9ekEF5/dHR6ffNqLPjZLeUoyi4Y0LBwiDtQvEHBB3O9mft2YSC4mQqJpQ883TaKfM2+U1mcHL1eXCYEcE3J/TikWm7J5PRY+XB3Iir9c+MBJzGLOcL1CO+4uqjZ8nycW7NuuzsOVtUsxcyO0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429912; c=relaxed/simple;
	bh=gHVqbeeLDW26xdNiUZY5UzwMkP98DCAKakRVGGlY3Dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=IUNERN38W4dTO2EAuF1eGrdyFZcM6wH+ekdLJKEIYA3hBNv7ux2rZTtF3UmTZBWTjyrJbP0NS1oOwHFtx//GXQqp5+ghVZn5KG8YMlPObc5AKtG/M5pwTo+eVTCQsFDtHagPiA2042UHbkNnAm1OtKD8yWSL5PW24zV8lJh5Zq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hWStQvYz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hWStQvYz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+qIG/0LvnjXMgyU8eqBX8hgYV7UmJPw6Xa2UEwpxHJA=;
	b=hWStQvYzQLOm0ON9nJJDWMAvd34plyYfpnF+7JVYE8HxwZbIDwyvG3uxst+H8Z4C7PlUuy
	q7Z0hnot79fmv+4doC4AO2CundLTFeh6EJcythPRWCQNdXFScyF0vDOgFSFEOQVUPwl4Dk
	4DMls4QP1lSomgkThYPwHIP+PhAg04Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-mf_Q4YkwMxenvNX8OC9exA-1; Thu, 09 Jan 2025 08:38:24 -0500
X-MC-Unique: mf_Q4YkwMxenvNX8OC9exA-1
X-Mimecast-MFC-AGG-ID: mf_Q4YkwMxenvNX8OC9exA
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5d3f01eeef8so757456a12.0
        for <regressions@lists.linux.dev>; Thu, 09 Jan 2025 05:38:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736429903; x=1737034703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qIG/0LvnjXMgyU8eqBX8hgYV7UmJPw6Xa2UEwpxHJA=;
        b=lwaklFCo9OuXkoFC7r+AR/CgbtCa1jubADdJ/kjBOx5eX7P4+TDPiUqYPUFbD9sSWD
         toohRoR6IFtiAI2c2mPB0uy4kRU9QnEadNVlZRGWRW7klATxPbqhsJjaEBXCW8ncr1pm
         DrtBTzp/pfOq24Tojh7n++YxxwZH8+AzYkj+h4pDBWIu2x4fvDkt/OXWfawzLhOC1DRC
         Vl6zo6iNMDyjYih7y+au0EiK9iV/J42xvuvelZO6DmB8Tyy0qkV0kBMUklusQi4CqcvQ
         w6lq0RYZltc3muV2cKk0TIhPt04O2FG5SzFicXu7mXCcj19eayOPKs4jIJFUmwVu1a1g
         6bHw==
X-Forwarded-Encrypted: i=1; AJvYcCVZFhnLDd+TmoVB18cEDxQiPKYuMRom3eMaDHGrn9KsKHaICVxUz6tfV9E5ne5qAshE77jwgg+y15OOfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyI4TSuegQaI1IeWB6Xq9KtLjULP6vGS1ltpc1HZ73uVr7L1fyF
	sMPaAhZMgZcAIUoo4sgl+9vCgtCYrKjvOq0RNuKiD4PmP/fjJ53RtD2zr9kY9PPPgnhsYK4+XeT
	wlvX8HuKEvbxx7u2bejj97WDhYmCocFMMXe8fMFUO8g6A/rSPtxCtuNXzjCT6
X-Gm-Gg: ASbGncusa+g1eIgnqdoqTC02F1d46secasSmc01TssxXUX5FrOTxyJ+L+F5VUpnIBfv
	kn9DxVd5z5fBpGMLBuPJQ9UBg6jgZv67gQZWkED7MQAgPMA489Nfhp/YNYT74pZfVm0ZpRkyEZf
	0qcd7fw2if427X3D+GkscJn12wGfi4jX5mHp44XQ5/rByGUFTjEsTyL1FlXZHuFD/1gTkgAQh0X
	D3t2ibQi4jWxnp6tbqINrWqsRnhNoDuTI/7J2hSqaglC+qsd1M95HsG1VdQ
X-Received: by 2002:a05:6402:3549:b0:5d0:e73c:b7f0 with SMTP id 4fb4d7f45d1cf-5d972e70945mr15040475a12.28.1736429902555;
        Thu, 09 Jan 2025 05:38:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsGUykWSOpesU6tHxPGZnO3JxPfRRnO6klBd/fYEFfPEHAwQWWT0oVTu7t2r5Sxoacsy+c3Q==
X-Received: by 2002:a05:6402:3549:b0:5d0:e73c:b7f0 with SMTP id 4fb4d7f45d1cf-5d972e70945mr15040371a12.28.1736429901823;
        Thu, 09 Jan 2025 05:38:21 -0800 (PST)
Received: from [192.168.10.47] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c366sm624477a12.17.2025.01.09.05.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:38:21 -0800 (PST)
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
	stable@vger.kernel.org
Subject: [PATCH 1/5] KVM: e500: retry if no memslot is found
Date: Thu,  9 Jan 2025 14:38:13 +0100
Message-ID: <20250109133817.314401-2-pbonzini@redhat.com>
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
X-Mimecast-MFC-PROC-ID: YGgYgcTA5-fBLTHNYVd5tknNDZT_-gEoqy0FMq4X20Y_1736429903
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Avoid a NULL pointer dereference if the memslot table changes between the
exit and the call to kvmppc_e500_shadow_map().

Cc: stable@vger.kernel.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index e5a145b578a4..732335444d68 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -349,6 +349,11 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	 * pointer through from the first lookup.
 	 */
 	slot = gfn_to_memslot(vcpu_e500->vcpu.kvm, gfn);
+	if (!slot) {
+		ret = -EAGAIN;
+		goto out;
+	}
+
 	hva = gfn_to_hva_memslot(slot, gfn);
 
 	if (tlbsel == 1) {
-- 
2.47.1

