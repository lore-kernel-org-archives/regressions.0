Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CE8345729
	for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 07:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727602; cv=none; b=IxnCuTioSdASwvW+aCuPd2NEMEMsocbch2jU4ZCO+DX1CzHR5agkamRY/HwFIuQ2ZKFOaAXioD41coNrAw9Ck4dhWZW/bQhYMdxhCS5xswJVciIP5/qa3PEQbDn/WY9tUFRzJ8VQukRf+mShO4N3FyMqHjArLg7obdDEOFxmvRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727602; c=relaxed/simple;
	bh=LP+CjnPTNKJTOh9M44NP04G+M4Hbff+bxYnyBcwSMCY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fg7mWtKQso93FXQ1MwupmlSUIm6m0IRnw3qKH2B9xYnuL13LtGPHi9IBRg6HYyRSrXWOeNxuYkaFIUdKwcr71ERtbDFE8K30SBTwHpRGaKV/BoqmkNA6euGCq3w/RD08ygjKmvgR6YVtF+KRJKduUe47RO+p0Dc5DpVraBIkbVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhF3lAU0; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhF3lAU0"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so968000a12.3
        for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 00:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787727599; x=1788332399; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WauUjNIZUT9UpQVIgggxGeGxRKN9frgsdAp/zagOntA=;
        b=OhF3lAU0y2iSyiKXHU2ERJ1lhyqwWNy6K2CKRbbMWSnWp4M8SBPmpHe2WDCteV5tlQ
         8G2xFQ8byh89DqLeexPvVnIr4p6sLyxFAbKClVs7ip5bEQ19nJZxtAbdUPaT5akiL2gW
         uaoG87IJakNNIMkZMbTD2G29tIoBKRnstbuEmaq2hjF7bpPntxk7xDGnGd3HqkCn68vU
         N8ZpzZenkXcZE2QIMpvfUv+lYat4MlPxxa6kaDoB6sjDrGQBfW7+KevTSs0BLpUX8v32
         D3HAM/Ba0V1DG3E9neE/ILGgKL9U2ectWpjCTtK826HtRc0Vrz05/pNNZoXDs690Spi8
         mQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787727599; x=1788332399;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WauUjNIZUT9UpQVIgggxGeGxRKN9frgsdAp/zagOntA=;
        b=cvBYO/CJPUnBXwK8fAwlYRP5lCX8LMiCivcOsBl1T67XhrJpI+L+IbSbDGzl8cezoV
         7XUOBsgN3Rgb44qsyzwUic/7xeHNpHhATn2X0Vi4dHjCPt6SKVt9gIO/pd1vqggt7rrb
         Yt136RBA3EMfFaLyxA4UqXpQAm4cAiZ26P9z1Y7N3jZeWl6fLJuNlgarofwqUnOVtT5Q
         ytOPghj46XTvHfKS75+aOhWmXV0okZUF+O32frRDyMqzS2yxjl5lGmG1j//SClH70iI/
         QhXDX99cwGzDh/EQrkEvzSxP3K2UiFZqtCqasXJfOFMOpj2+4Fg8m4z8Foyc71K9yRWF
         RaEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqcvxtKs7wmn4kovolK9Ch8uKUkfUf+X2uVx39ulb4/xd7+w6pDIhgljt1lWfCJSbwljjBFpUXTsgv2sQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kNw9mP/ghKf1sRr5wRG5m3XtF81EbDQVkYt2fk3atvSdmU9BOk
	nL4mBxxgAZWp6bICQj2bVMDLKWpXSCTNt6LxfUL2dHUweGi9t5fEO2+Y
X-Gm-Gg: AR+sD13az67k9kDLPQWKAldkQiuCcz2JpK/u89KDHo2vDTU92MN0ugfTNVnWwCb9oN2
	df519MhTSODxjJ0+k6B8JZL7p9llmKIb2AuwD19m5vAfsVD3GzpY5Jql5bAVs15xKgUp12nQuhc
	brCX20z+lfd21egVz6KwMvi75/JoD52ZhCuvHFSlI+bKgZx/mITCCuQ3zHca+jfw/uKgKdwV3xg
	k8ZXXj+u4vv4X0+2Iy575C+hLj2lYgzVAgJMi4JPKi1iQ4VWmgtwGgePTegeAOkXf3xfRLiLozH
	TT9U6Qhp5EUTDIzzQ9/V/1gOeKitgQ1bLP3b6EwD90O4JGLRTF2reilV6RdCh28WjDhSjt+Fccd
	1HEk+EoJrkXzSKMNu2PdpmR4RcRIRJfIv4sgxmvXLGTnzbeqYitjW1PUDaiKKDImtjLz7gdgqe/
	E8g/1Ec2oJ8BukC/8b8/OHLHZGdrGAZoCr4fep+VD461PZSffce1Wt+Vckc8XeAIaekTAU
X-Received: by 2002:a05:6402:1f01:b0:6a1:b0b:bc2 with SMTP id 4fb4d7f45d1cf-6a5df65b8c9mr6399127a12.10.1787727599087;
        Tue, 25 Aug 2026 23:59:59 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8d0b71sm2826662a12.9.2026.08.25.23.59.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 25 Aug 2026 23:59:57 -0700 (PDT)
Date: Wed, 26 Aug 2026 08:59:53 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mathieu Fluhr <mathieu.fluhr@gmail.com>, Lovekesh Solanki
 <lovekeshsolanki00@gmail.com>, Thorsten Leemhuis
 <regressions@leemhuis.info>, Mathias Nyman <mathias.nyman@linux.intel.com>,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org, Forest
 <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
Message-ID: <20260826085953.7f8e3949.michal.pecio@gmail.com>
In-Reply-To: <f6f2f984-f31b-42c9-b120-6c179803dd2b@amd.com>
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
	<CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
	<CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
	<07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
	<aosGtkE_diwVJJtB@eggarch>
	<20260823174059.46fec036.michal.pecio@gmail.com>
	<aoser8dLytrwqBC2@eggarch>
	<CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>
	<226b2f34-fa25-4ca6-8afb-0b3dc942715c@amd.com>
	<CAPyJwA9GvqeaBYhN56L1S9YW-rwWgFejrcNcE=54DQC3Eaqxww@mail.gmail.com>
	<f6f2f984-f31b-42c9-b120-6c179803dd2b@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Aug 2026 22:14:32 -0500, Mario Limonciello wrote:
> This isn't a BIOS regression, it's been around since the beginning on 
> this threadripper model but it was harder to trigger.
> The Linux kernel changes in the bisect exposed a platform issue.
> 
> The workaround you can do for now is to disable runtime PM on the
> XHCI controller to avoid triggering it.  But it's a platform issue.
> 
> For a proper fix you need to reach out to ASUS to get an AGESA
> upgrade. You can ask them to reach out to AMD if they need
> assistance/guidance on the versions that contain the fix for this.
> You can share this thread with them for reference.

This sounds like it's a known FW bug, so I suppose the exact failure
mechanism is known too. Is it triggered just by putting that PCI
function into D3 at a "wrong" time, or is there any USB/xHCI layer
involvement, particularly anything out of spec by software?

I ask because we know one case where dodgy SW actions cause some AMD
xHCI to malfunction, but the problem is contained in the USB layer and
the affected xHC doesn't bring down the whole SoC.

Any thoughts about the patch which reduces suspend delay for root hubs
specifically? It restores the original timing of PCI resume/suspend
cycles, at least as long as there are no external hubs connected, and
has just been reported to mitigate this problem.

Regards,
Michal
