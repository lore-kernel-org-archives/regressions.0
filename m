Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E636AA7
	for <regressions@lists.linux.dev>; Thu,  6 Mar 2025 00:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741219857; cv=none; b=LlUPXIOb+LIrOsfEHKiIirIwNk/mcJaNMhPCUWUPvYlOdwmnQYFmddmrCQOl8B09jHgEdlYnAlznm4NCqRnKCxTtVIUGJrCpb7wF8X/5gVOUjnjIL49mHProPssQXJwwOfEtXYg0gpl1uWOAB6/aRBwWfroupx2PWf/oIVjcXbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741219857; c=relaxed/simple;
	bh=BMP2Cu6ueAsVg5DJpgRqTk8AwwWjlXRp7w4LMew/LV8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bKoTMNXrhLonpWTeC0gtcJ8B3nMw50KPcmOkjGHGVaYREZFG9ooc3DedUZQgjs0W8TKENip1laB1wnzs0KmjESUTEU4MSI4Tx9uNp+o1SA7dKPUmrdNrqjHpWcyoXH1X1aMAVsxZ/WT3Va9g9yzXdW/SMl/D5wshUu9z2N6qhD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oLSKp0SB; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oLSKp0SB"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff53a4754aso351560a91.2
        for <regressions@lists.linux.dev>; Wed, 05 Mar 2025 16:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741219856; x=1741824656; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkAf3bS5L3Hu0wBjNyDNUVwPUQfV/Y/RYDcUi88Gr00=;
        b=oLSKp0SBuqjKG/df5LzUF++YrmPU06MQC0YfKlpPaLrequKhrLO/QqRVEZQXs6iVwO
         KgJ+BK09F8t5D2Zu7joRnytyyTpdazf2ToICjW+5scIAXnpUTB9X6LdcaCpLL0qebTP8
         4kvv+IVp+rD7Eb85KX/iYp8bbZ7uZS3QEb0dHSqr3iu6AcOJv/BfO5xa71kvuf88mp8M
         NBnEZG88925obs3IH9cByVsDtebpDszZQUxhVLPriZouWGGnuMUE+OYd5EaUc8qWY8Dz
         mb028dhNaXu2Im8qIJD5MC/5v8/d1jJbTVvn1y4PL1+ayRB9iN76KYwmN+70dbrpjRLr
         qW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741219856; x=1741824656;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gkAf3bS5L3Hu0wBjNyDNUVwPUQfV/Y/RYDcUi88Gr00=;
        b=XWFcs21zcTjwxeMVqffFUOdOgGYisJ3OjSjkcmYZV9YLd09Dg8TECeOAgKS/SsuvUz
         CMyTThkWLU0OO/6v88FXNsRNjBU9TIfLHMiiVtCDpJ+pmGFKmJGeojI0hrMh3YqwmIcF
         v6zJ/vl5Tc5BxXnhYMKAvcEaahMK+u2BUimVq0bM21Mku7I5jvxQcXnGPxrn+AbcoAQ4
         PNKmLqHWyZEXMWR2SfTL4MLBlRqlzyhNLDJ32OfSB6ErOHFRtxZLh+6hziU6k51O8UWB
         hpJbytQ1FxuExjWoQbmytEJ+7Y47OZ0cOIbqQHAxcRm25lmH/nxPu94jYFSvW6vTTu4D
         D6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVquf+oRNMRhbvH/rX3hqgksnp1NUcQhjFjSX6gV2h6nfcuHlweeg/piH2mfsFaIL/gduIr6BLtwSz8Kw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTHaqsVw4c+b2tFS1JKxZ9xMPjUPUZq+lvT68nXIfIYwZtkzUO
	UGy60VKaOS9LxQzKhiBBZA3tnx7WYI+P5tEigcGYUmaNBNM9k/9jjLVktxy20xzrq2q2+oZorrl
	GLQ==
X-Google-Smtp-Source: AGHT+IH6mtvWi524iNsh5MnZ9uVRt0uAQkqtI0o5+FBM2OSWGK6g8TOWH1A2818hUQq2ucNbEVa/38GArX4=
X-Received: from pjbqo11.prod.google.com ([2002:a17:90b:3dcb:b0:2fa:1b0c:4150])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2712:b0:2f2:a664:df1a
 with SMTP id 98e67ed59e1d1-2ff4978fd9cmr8922776a91.2.1741219855851; Wed, 05
 Mar 2025 16:10:55 -0800 (PST)
Date: Wed, 5 Mar 2025 16:10:54 -0800
In-Reply-To: <e5f56fd2-b2e2-48c1-bb3d-e00b61807893@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAMEKE0Hd3S0-25afhWQhNNitbc7njp0ftO+Y3QmgS6CyFQh4ww@mail.gmail.com>
 <7a212431-5320-464b-a357-507fa6511586@intel.com> <e5f56fd2-b2e2-48c1-bb3d-e00b61807893@intel.com>
Message-ID: <Z8joDnLe-A3zdwu6@google.com>
Subject: Re: [REGRESSION][BISECTED] Some applications under Windows 11 libvirt
 VM crash since commit 408eb7417a92c5354c7be34f7425b305dfe30ad9
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Miguel Ruiz <miguelies.ruiz@gmail.com>, ravi.bangoria@amd.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, xin@zytor.com, 
	tony.luck@intel.com, pawan.kumar.gupta@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, jgross@suse.com, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	christian@heusel.eu, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Mar 05, 2025, Dave Hansen wrote:
> On 3/5/25 15:42, Dave Hansen wrote:
> > I'm also cc'ing the KVM folks. I don't actually know how the #GP from
> > the split lock detection will manifest to KVM guests. I'm kinda
> > surprised it crashes the guest app and doesn't do anything more noisy.
> 
> I've got my wires crossed somewhere. It's not a #GP, it's an #AC.

Heh, nope.  Third time's the charm.  It's a #DB.

I've got the fixes queued in kvm-x86 (and tagged for stable@), I'll make sure
they get to Linus' tree this week.

https://lore.kernel.org/all/20250227222411.3490595-1-seanjc@google.com
