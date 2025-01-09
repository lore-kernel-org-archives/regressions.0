Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A361A9B38
	for <regressions@lists.linux.dev>; Thu,  9 Jan 2025 19:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736449647; cv=none; b=uQtATvQTZBz4xnn3uj2gThB4nxbYIsGLivWKsRa4Xc/a/8Z7kE8T9UGk85hQUMR12R+OS0TpHQ66KvdpqAk6cnhENOgraIdAjZCcmk+i9nc1DOLBVeQjgYx6Z9CMmfMw5RQZSfjYM/SNpri7X3ecMOo7kRt3SeAO8snpcXNMoKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736449647; c=relaxed/simple;
	bh=MKdvbtlSNREUD9tQ3WDTw2X1xsQst3yft3V5eJgw5mU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=deFA1wSpi10qoLKEZAIA/T6wA7+L6LLkmco0lgAckMFFOfINHxQ4khB0i8hy6Op6iOLbbcIUGV+kswbQkZOuvCEnXVFyK1oH+JlaQYcdxc9pfmUKy0qtUCKOJ5z3Qy+kMOqePINKMMO/B7LAicrKkdDpp9j9sOo6iMjbfCbk9BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Df+/4cDp; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Df+/4cDp"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f46b7851fcso3594035a91.1
        for <regressions@lists.linux.dev>; Thu, 09 Jan 2025 11:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736449646; x=1737054446; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YAFl8oxMn+4OWiBfmOCqt1n9SmilznMI/rM3XM++rFU=;
        b=Df+/4cDpNXPeVW18+WmajnaHH7Zn5+VqMs9ONr3j/AO0bhQ0srhlOwAKdBH1m8Gf54
         /a0Lk6YEbex8lQeIElxpQKke/8629ub43+lMy6psCWm1j73/xC8WL1WzjNv/XgV59A8u
         cXhF0Gzlw7p1X3X7F1VRtTvDQdR/6JpV6Ot3y7mzCIl85ErYHgCDSf2vuuvo+I4Nxz+H
         t+v+3bsm8Bu+Uz4x5HrX4R45ZlnDOswIlNaWtj0ntPkqg5wIPdUaJ/ykwthqlV+u5LFL
         yqCQgo/6Mu8daIqsgraP72A8eyfoueAGGzSVbIlB6vrDOotDpOWA9rT1fLNwJQugtiT+
         uDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736449646; x=1737054446;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YAFl8oxMn+4OWiBfmOCqt1n9SmilznMI/rM3XM++rFU=;
        b=cnVw6ZgWUoXAIqXMkdx5WXGZ+pWPoFgudLNektdqMXh7IAdgPFSMLxRoPIWJY39Jpx
         w17LFDKQfO7oZxiuY+uhIhO1TbjpbHG0EavDdvipuQk/dUeja7Gz35HWb13KB3lj57r+
         eiYB9ujBqXMF4yqxZo5bjS3++HawcE/Vrw53PQ7rwc8uI1szGfU2Ti3WoZrca3+e9kEa
         fJZBmsR35uPRdckfNFg0ckpbRI3kRWV2T8BgfcZ9h0L7n3hhIqIrCUmMQUtsu+J/Daru
         xd3xl5TLztnp4gmWFvagty5dZW2vCCucjCkaEo9tGlw9RVQonYwLu2FrTRKuJvqCQyV3
         jBTg==
X-Forwarded-Encrypted: i=1; AJvYcCVp0Zmcneh/mNA5+x5qdmOnbWiW5oLJCmw1GE0RKNemQztuJYPBcb/A5Qyj8LwO4kS5Nw/J4RAekYplrA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/Pm84yIeyFU/ryHHKmSCCf84XbQlVtS04hgjdgRO0d//Qf/6/
	Ak5LuoltqB3A3RMAs+XJietu2X2k5t/iYxM31oc3CWLt8efR1QPIXdQZfgbiCOHU9Dk1Rt6VGpl
	9cw==
X-Google-Smtp-Source: AGHT+IGfqHfrrOW1TXoHzJjl1gNv82mqMiJA/BmNQ6TyvR9A3FEwcV69xv4bF8nQUa/IsMCkbReXjlWsoDg=
X-Received: from pjb12.prod.google.com ([2002:a17:90b:2f0c:b0:2ea:5469:76c2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f91:b0:2ee:d797:40a4
 with SMTP id 98e67ed59e1d1-2f548f09ef9mr12271408a91.8.1736449645722; Thu, 09
 Jan 2025 11:07:25 -0800 (PST)
Date: Thu, 9 Jan 2025 11:07:24 -0800
In-Reply-To: <20250109133817.314401-6-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250109133817.314401-1-pbonzini@redhat.com> <20250109133817.314401-6-pbonzini@redhat.com>
Message-ID: <Z4AebPhhcQfGVmNO@google.com>
Subject: Re: [PATCH 5/5] KVM: e500: perform hugepage check after looking up
 the PFN
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, oliver.upton@linux.dev, 
	Will Deacon <will@kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, linuxppc-dev@lists.ozlabs.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Thu, Jan 09, 2025, Paolo Bonzini wrote:
> @@ -483,7 +383,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
>  	 * can't run hence pfn won't change.
>  	 */
>  	local_irq_save(flags);
> -	ptep = find_linux_pte(pgdir, hva, NULL, NULL);
> +	ptep = find_linux_pte(pgdir, hva, NULL, &psize);
>  	if (ptep) {
>  		pte_t pte = READ_ONCE(*ptep);

LOL, this code is such a mess.  If no ptep is found, IRQs are left disabled.  The
bug has existed since commit 691e95fd7396 ("powerpc/mm/thp: Make page table walk
safe against thp split/collapse"), i.e. we didn't accidentally delete a
local_irq_restore() at some point.

@@ -468,14 +469,23 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 
 
        pgdir = vcpu_e500->vcpu.arch.pgdir;
+       /*
+        * We are just looking at the wimg bits, so we don't
+        * care much about the trans splitting bit.
+        * We are holding kvm->mmu_lock so a notifier invalidate
+        * can't run hence pfn won't change.
+        */
+       local_irq_save(flags);
        ptep = find_linux_pte_or_hugepte(pgdir, hva, NULL);
        if (ptep) {
                pte_t pte = READ_ONCE(*ptep);
 
-               if (pte_present(pte))
+               if (pte_present(pte)) {
                        wimg = (pte_val(pte) >> PTE_WIMGE_SHIFT) &
                                MAS2_WIMGE_MASK;
-               else {
+                       local_irq_restore(flags);
+               } else {
+                       local_irq_restore(flags);
                        pr_err_ratelimited("%s: pte not present: gfn %lx,pfn %lx\n",
                                           __func__, (long)gfn, pfn);
                        ret = -EINVAL;
