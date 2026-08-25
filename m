Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1AF3A5E78
	for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 10:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787652921; cv=none; b=REK0og7uTXc5dXqbkxWsUWyeEeftZxPVJ+beUBWrIagAb2EjpU1UCsiCXN4qyR07QYK0+6KoZSgNEUe7qKkfLRJKL1k9NKqBHXkTDGhJuo3H5omaS4buIB7GmQHN6nm7c7hKg2zKDANBeUdvj+8xT8mMJbrXLZh2rY3lYc5Fy8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787652921; c=relaxed/simple;
	bh=tvZn/DMGKqbYfXmiEXnBW9Jf8jg1KanjiDCL69cMdX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMzu89kOS61txHczXzf+LVgO2HeD35S1AnINVO29cGvMm3Z9MqfHetNtJ9sstFZAYWNwh6ztOXA0jwO3zvVq2qjXHTbXA8YlexZMPIrBAf7fGHqHel0FZo2hzTbpIsZ+Kt+2jWYnh/5dDE1aRZ4JIWVLm+0eynTtCqAHJu+kGoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkGjgTiL; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkGjgTiL"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9aea40d799so2776356a12.0
        for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 03:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787652920; x=1788257720; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t/2kEnaWyYQdlZqHnH4m5uiHvxgG16cMzCUkrsocMZc=;
        b=hkGjgTiLhmZUFRWj4gwSvpv/As8F6ez/gP/AoZQbN2Hfr1k6MtnUUQUY/NpvGk3s9P
         1eimGPxUqKeA0fKNZ9xmXRLBjnCMUA8CTb9PkjRw3cwRsiIwBE3QmLv72OIEw5rgUNtC
         i3PJypsvKIWst6rWBqZNVN3fTbzyUv6KeKZwd1O4828dQqY9mfqbo9DALvkiPRFxUDP0
         1LoBLxl1cPac2O1FKpuQtiPDim/BjqgEMt4scncHdaHNbEuqHAzXmox7je05aRa76Sqo
         Mz00X5gTZrE0y/1eodu0SdS1z/RqC1yrtySFZnReTTc8/lJxUjSk1Z8SGGyOcexvItfD
         XONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652920; x=1788257720;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/2kEnaWyYQdlZqHnH4m5uiHvxgG16cMzCUkrsocMZc=;
        b=C+9PZYlQhJmoJlhIZSFzGDo18jZDodPWNHaFUxbTZ4lTzqao8BXJkKCOdAdfAYWtlj
         vRvR7jXacGeT8zARrE+lU2ITTfQxyg59l4jJcHRWqPW3c/9l2fsGT0J9QOWUEg85B9WH
         JGXM9tMgO809fzr9rcubffEa3SVPMsf8bdQJjYdVVUr2GcejS2imp8AFfAUX1OhRECjT
         H2Apukq9x5tNq0TtnIpkGngWw+on9hTAkZrrQ+8EIArVmQYeJYIXh5C8k9efhfE8oL6O
         a+3svIw8n/hFNuHl085IsxVf+A0dxGyK2yaL7gFKFUXfRrVRiCZb8BRIeOh/id2MiOOb
         a6Tw==
X-Forwarded-Encrypted: i=1; AHgh+RqrWc2bipxgXn8Kwi/JpA9hi0zmDRKLGEarxntD9bXwau4ZZyXQaFrXgaotbKlmNK7xmV/RX3Rxz2wYsg==@lists.linux.dev
X-Gm-Message-State: AFuF++nztxkYHP4L/lGw5x2BoYhIBTPFThWgE7FL3QMu/cFchQLqiOgw
	46f8RjCbswFPqrEf4QwB/PtleTnR6Z8Lc+MJaviAIN19z/S8xm3DGO3X
X-Gm-Gg: AR+sD12ntKE1BRsCnenLlEciz1HjEYv0wRnDJUVGFK4uk7R+haVdrMA+Nk0b+kw6ZEK
	9XjFfOVAYMkIyb2fNLZLcsnrTEPVsAm3YRT2A24tL4NwL9TRnDRd870yuiWzA7Xbhi1ahLVGRE/
	JloGpLMiZu4IrKnx573NoNEWbwctB3h5Q+H2U0Eo0BYj+g9wkqqhlG+zvMlvmTStet+n62VDXX8
	RDDSY1QYdnGL3YiAxnijP2M3jq/FD0tatMfnPD86MaBnKxelEPj28LRpbCOyNvIr/AB04rUOvUF
	Zguu89ZSot55YXPsMs//J8vZeUxsc+qNAYgzfvdBRUNbTxW57nTZiGRiephojCLl/pizpss1joc
	FhGn0Up/LAOMkc+IUMINOG0pYTlZzR8tXHSg3rJEGUjUxMXyT91U/4zc9WDIzUPIShl7IkVgv+i
	yGbdtw40D4XtnR+QevF/OX4MTPxUC2G2ugLrcaVwAyVpqaGJm3zSZhb2C/CTZVvvJyYFzPL0xrX
	vZ3pRbdkdkPvQt0wG0addzYkO3SeO5N
X-Received: by 2002:a17:90b:53c7:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-396464a15f2mr11505556a91.11.1787652919563;
        Tue, 25 Aug 2026 03:15:19 -0700 (PDT)
Received: from localhost ([2409:40c4:101c:e5a9:a28f:e499:1b07:43b3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm36749172eec.17.2026.08.25.03.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:15:18 -0700 (PDT)
Date: Tue, 25 Aug 2026 15:45:15 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mathieu Fluhr <mathieu.fluhr@gmail.com>, 
	Michal Pecio <michal.pecio@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org, Forest <forestix@gaga.casa>, 
	Slavik Dev <developer.slavik@gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
Message-ID: <ao1qAlO8t9N3kfbZ@eggarch>
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
 <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
 <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
 <aosGtkE_diwVJJtB@eggarch>
 <20260823174059.46fec036.michal.pecio@gmail.com>
 <aoser8dLytrwqBC2@eggarch>
 <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>
 <226b2f34-fa25-4ca6-8afb-0b3dc942715c@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <226b2f34-fa25-4ca6-8afb-0b3dc942715c@amd.com>

On Mon, Aug 24, 2026 at 05:09:02PM -0500, Mario Limonciello wrote:
> The behavior that is described here sounds like a platform firmware bug to
> me.  Are you on the latest BIOS available from your OEM?
> 
> Can you please confirm:
> 
> 1. Your CPU model number/codename
> 2. Your OEM (from /sys/class/dmi/id)
> 3. OEM BIOS version (from /sys/class/dmi/id)
> 4. AGESA version (see commit bc91133e260c8113c1119073c03b93c12aa41738 if the
> OEM didn't tear it out.  Otherwise look in BIOS menus)?
Though the issue's only reproducible in kernels including commmit
8f5b7e2bec1c36, which their bisection showed too.

Could the trigger not be the 200ms SS hold?

Regards,
Lovekesh
