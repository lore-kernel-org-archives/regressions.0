Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720D0494806
	for <regressions@lists.linux.dev>; Fri,  4 Sep 2026 13:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527635; cv=none; b=l5HNElA/sDS2wshMGkbcm5ktqY+GI9+bdqMPhoOrLu163iwE2BS7KlitVDaNL5FwaXTMrm7vEK/9NhrWeIMJo0zTa12OXcenmtYQ8BYWqZAv9x0S7+mrkS1BsSxpTZ7QLvCN5EuVMps2vLC1+eLh0bgOMhCKhZVJkEMHkfXPlvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527635; c=relaxed/simple;
	bh=qeW9HjB/GlkaIQLm8ZbJVD+c0HOdwkjWG+Sfd7Hjcqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VaJZM5HwPshate9Wi7ZzlWVyDPChuK2Hdg3GyOlgilScPiuIKop4HbcwnfBZe56VuxWK+YE+7W5mGc9IYjRb1Xbss2qevCbUMYWsKgl3AtodkFI8AI7z8siO1/wpFQk3Hv+DWS+O7Er3PK7c8b6bXarVQsPHHAOm953DLTiJHRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=opeVrT2Y; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="opeVrT2Y"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-46adf49ff3dso641985fac.3
        for <regressions@lists.linux.dev>; Fri, 04 Sep 2026 06:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788527630; x=1789132430; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/o90ljmvuQQUSHocuJOX1OqLfyNrCD/R11+CTsvEbww=;
        b=opeVrT2Yq0jz5RZ57yOZ68H9fSh7LdDNDskFes58bRdtUFhQaVq0iX5kHY4lHci1IR
         HJW14pYqocavjh1HX6fDC40ymxS7Qv46Fx67pDsBL4c6GuAgHqT8Rpxfmh+4xCA1y1yV
         NDQFHI54gZdOrM07kE2g75FwuJhZ2eVTJP72onb1vUq0Yfo1E0A8J5J1O9pmCL35h8Qa
         lt0e6MM2IJ6ft1y26NbziswGCIGywD54YRi+UsSTy6OclcGyDFv+eGAIwt4Ps7864ekF
         /OMCA99hxjsvoQZGiFcDXxafQOnvglOU9gBZP3MSBhuhkzVAJyU8NgTwkrAs7liYp3G6
         sKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527630; x=1789132430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/o90ljmvuQQUSHocuJOX1OqLfyNrCD/R11+CTsvEbww=;
        b=In3KwBNaxpELz4PMVqLaoCtA8QuMwTHRPz4RNsSGUt8gO/1g6/TkFItXBFZ0cNuNNj
         Hdo8HHQuT5iw6DaXPUly79VpsQHrW/Y2u0h/nTv+gJ98tQP2vdpIKRpMuzQVYo+BOC4R
         9Hgh+DT7lbzhkWLdVdels64gZAeH7B1GxfUvfFECygmujv/niVWX59GCRgZZP94iK5j4
         Kv+ap+wAFrOWysFysq5ohLyjglBWoBzHxyhWIoxa9NctNEaUadyGUV3I2fRL35Wz2TPq
         d+c8cT4tehFOV+w+KXDB8yNq85oTjLfoBeLhDvvDvgl/8c9JTi9in7EslOVSF/7Lx5PV
         NnSg==
X-Forwarded-Encrypted: i=1; AKwUvBwOOf2/s/B1Xarah405QxDp9RR1KRSbJcrqcS6GVwqNFiv24uQ2okTn1tqPFsj2Lemfeqyv9/z02XgeSw==@lists.linux.dev
X-Gm-Message-State: AFuF++mNL/OQfgrYCZMjmOLLRIPJ0p1tDJypXJoxVMZuDxqlh/RmHzuu
	Bf2cdDiuJnYVfzV6hmh2LtU3VbygL6ZsBfGzzbFWs1bk8o8ITjNC0+ho
X-Gm-Gg: AYBFou2yCeA/UQXFJqFCEdPEwcqz6Q8+27Wo3Uqav1f8MJfa45DOVDzalmMZyIMm1Iv
	WcRB3VQbJYMFOUS3EzYYOx6DYFxToU6sT47IzxfPuNA+X3PsQu93RN4W3Qb5HTWlprBSCZDwIh6
	P5ysjIeyQNH8OJG53sOwZVSI2QhiJKq+CrPM/NRqOR0ziBHveppVEEipSJNT7JS+/8cSczdh9FY
	1uKyR5piq+iB0fFSquh9SpEx3Xw75gSnViDlQ71aIj2F/XCLzv4TAYq4aB+TwGkkXScpDGBEYH2
	1cNfAgI7yMaNU9lnu/JuOb24JmspMylm5XYeiNKGc9pZjomLSM2PvbHN8eNEC//mAaH/niqTHf6
	4HHXqkgt/Q46IyEzTDLLsBHQHZcuAq2VWygpaOV7tTM2/70TUum9wsJKdJ42N77OOhhGZMfLFZb
	rXjrlS5lCTllnrejWfLjGpFF10dGgPLBPtBHrNMbbmnHPoN7b+4cQAjipk2Ji9OhXa0/Lun9wgh
	iGHr0haM/FpIL2XiHbW7qWp0j3Bjg==
X-Received: by 2002:a05:6820:162b:b0:6b7:46fc:1cf with SMTP id 006d021491bc7-6b746fc2ed1mr2604016eaf.46.1788527629952;
        Fri, 04 Sep 2026 06:13:49 -0700 (PDT)
Received: from localhost ([2409:40c4:180:9098:c5e4:83d7:dd06:4e15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm10301543eec.15.2026.09.04.06.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:13:49 -0700 (PDT)
Date: Fri, 4 Sep 2026 18:43:43 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Pecio <michal.pecio@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] xhci: drop 120ms U3 LFPS wake retry wait from
 runtime resume
Message-ID: <apq4FFSD2QKG-jUu@eggarch>
References: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
 <20260831190349.29590-2-lovekeshsolanki00@gmail.com>
 <a6a8526f-4b6f-46f7-9d02-05bfe3efcd48@linux.intel.com>
 <apbrp8EaJoIfEg5X@eggarch>
 <1be8e57f-9abe-4b34-bc09-e7934a2fa1bc@linux.intel.com>
 <apg16LtZ-ru9MIBQ@eggarch>
 <082467bf-d045-45d7-b097-97a5790e79d6@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <082467bf-d045-45d7-b097-97a5790e79d6@linux.intel.com>

On Thu, Sep 03, 2026 at 10:42:48AM +0300, Mathias Nyman wrote:
> On 9/2/26 21:21, Lovekesh Solanki wrote:
> > On Wed, Sep 02, 2026 at 03:10:41PM +0300, Mathias Nyman wrote:
> > > It's possible PCI side or pm core already provides some easy way for xhci driver to check this.
> > > This specific issue is currently not on my todo list, yet.
> > Alright, would you like to me to work on this? I could look into
> > that side and possibly come up with an approach.
> 
> Yes, please, that would be great.
I took a look at the PCI / PM side, and it seems to me there isn't any
reliable approach for xhci driver to use right now.

The pci_check_pme_status() both checks and clears the pme status bit 
and the pci core devours it inside pci_pme_wakeup(), and 
pm_request_resume is async so xhci's runtime_resume may run much later
after the bit is already gone. We can't simply export pci_check_pme_status()
that wouldn't give any useful info.

One solution I can think of would be adding a pme_wake_detected bitfield
on pci_dev struct, we set it in pci_pme_wakeup() when PME is confirmed
and we clear it in pci_pm_runtime_resume() after the driver has
returned.
Then, we could directly read via pdev->pme_wake_detected in its own
resume.

What are your thoughts on this?

Regards,
Lovekesh
