Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F2D3C2B95
	for <regressions@lists.linux.dev>; Wed, 16 Sep 2026 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580857; cv=none; b=THCpI/U1udycEGLMzG819Fh+dWIlfxMhS3OsN4etHdmIXFmZdLkNwdUCd0dpSxvWHHvWNmfFjltSAvwsoYAGlWUKKpnOKOomRewe973+8X2YrHltyi5Qsecy40sdbLiTdLuaCk3iAVGtuCeNs11wMrBxJA3+mAUlQ+U2AfnGzHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580857; c=relaxed/simple;
	bh=G/PY36hb3mMFej1b0Th4YsjbgNjq9OtQrJFaa5sQyUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fLDhkFiV1iFvAnEgj0EGX6h2LqR2WXQ2mfoRW7pltwS69hQM5ZP2E74FOeG81lapSBIupJFSQdTjbhE1bpgJwIEIdBACdMaLSmxntB7eCJM+KrYyOJwYsqwcwhZyM8ZFs5gcJmMTrmuDAWjEB4dD73XoXB5syQmwJ7a2GqZLM8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFKZ5bw7; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFKZ5bw7"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb751so1094751a91.2
        for <regressions@lists.linux.dev>; Wed, 16 Sep 2026 10:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580833; x=1790185633; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5fRuhsyZpo67PM/nz3BCI8bcnib/ogSlc/1jN1DlRcc=;
        b=hFKZ5bw7XCyYw73dS54VZuyPg9V7Yy58dfC0lSh5NnUUH/hif7lc9upnn7zeNDoThs
         fkld/1tDICTZu6o2xIhxdy+EJDauBysg7r7UGtrMZDZwQRYMgsWgSEMyG0BX94H7brf5
         9B7IVk4+9/5urWFleTDZzxfsA4i7bFxw7l/jowZmnwMAQkzxfrzznInA2M8PK+ecnMtG
         SHaEtx7oJ1p+ayAdUx/R8T2JB25/tHk/u+CUD5HuOffE2QGNNG4zk84i0HRIuIze0Q4b
         a4/UX+oDWjAS3THyuNUn2XQtGTaFtmoTR8lQAWHqQihDFyh8fq1YKJkD+zALoLJaHC8f
         fRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580833; x=1790185633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fRuhsyZpo67PM/nz3BCI8bcnib/ogSlc/1jN1DlRcc=;
        b=khuvnXbSc+8OruoHhkJxOJYyDRil1R80/zhTUTN7c9yIOHBYicbp2NAGyT5NvROndJ
         gq0n8z4ZtUU8OicETnQtp9QE6bmIlGwL9sNDyn40SjM2nV5soE7O4IyZ0ATX79Na0Gu8
         85NpBVAS+xOH7kzlnEgBxzrEfYkAgDft48rGg/4cpfWptfwDeTGuxxuozaSCWsPFgx8b
         Nz9ZP9yXGtfxmczD3jVOPshMfsd3wde6JS8EFiQqW3cH0kBrt0CgDwEXpE92jJR32o+l
         RTB2n/mCP/AsX2eR5FrvuxOiP21qvusCVCjk/tdeAghoHGlKmhg/EqFN1qIlgpN00Di/
         4eHw==
X-Forwarded-Encrypted: i=1; AKwUvBw4bK5Ya5k3n1mGICAAfzffmF9Q0EGcZ0l7bbHc2zmZPiionTeYhWXlZDIlPxEsHHhu8XUbz15b/qQITg==@lists.linux.dev
X-Gm-Message-State: AFuF++kTxVGRySUHNbc/+QznEgVcKgBcD415OiiOTgJqIEDMZE96Qvtr
	sv7A0b5WSRHLkq6ax9yHr2UbqTlstxwhIFjhNXxaG9mLNG6OwzyoPVBs
X-Gm-Gg: AYBFou29GHZZO2spzUCmphpa9t0XMeX/DSovdThosdnTu2dvTaMYJH+49l5FLPDYWeo
	3xdrobhWJXIc66pSb03Wg67/YUY2CeGCCCkiyUOh9gk9mX822nGeVgBREh/0/D+BCBUVkf43W11
	Ws/ekyQoiTiOdSCTHOjRaTT4XV0I14DiDv338MhdQM3M+j/xbIdTus5zJ2k7JAHP6G2siu3unlt
	6YJY7yakM8/JNdYqv0ay3SakeXIU7w55y55s7tRPIekdnjub5icAIKGPZa/Gfh0pFlDyEXnLmrJ
	AAAWV27XdIueeaaj9fpFr076x7BihEte4AY1hxgQL9jOQiyUJA6DExR0tjgqz+U7U7toL3SJkYB
	ESAFdpePuNIPrQIfoW6LxROiiEMGJ3kMED0Fh2F0uhXRAcADOqy9UEf9/+MLQAWtoYaQ55HcHWK
	yn+sGbSkrjICGDf4IiErPCX00qf6HA+nMOGTmwuZ2BRa3Hl2rWrMIw+IJOgSbydfO1MHz2WY9Dh
	LkvMVd//DI9OUTzUZSIDvIcskpuZMPYraC/Hg==
X-Received: by 2002:a17:90b:5624:b0:39e:b7:cbef with SMTP id 98e67ed59e1d1-39e1e5612d3mr10626719a91.25.1789580833109;
        Wed, 16 Sep 2026 10:47:13 -0700 (PDT)
Received: from eggarch ([2409:40c4:18:7581:88e6:16cb:6cd3:1ba1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1c7e2200sm1772020a91.4.2026.09.16.10.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:47:12 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:17:05 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Pecio <michal.pecio@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] xhci: drop 120ms U3 LFPS wake retry wait from
 runtime resume
Message-ID: <aqrK5PwpJodCmbdM@eggarch>
References: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
 <20260831190349.29590-2-lovekeshsolanki00@gmail.com>
 <a6a8526f-4b6f-46f7-9d02-05bfe3efcd48@linux.intel.com>
 <apbrp8EaJoIfEg5X@eggarch>
 <1be8e57f-9abe-4b34-bc09-e7934a2fa1bc@linux.intel.com>
 <apg16LtZ-ru9MIBQ@eggarch>
 <082467bf-d045-45d7-b097-97a5790e79d6@linux.intel.com>
 <apq4FFSD2QKG-jUu@eggarch>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apq4FFSD2QKG-jUu@eggarch>

On Fri, Sep 04, 2026 at 06:43:43PM +0530, Lovekesh Solanki wrote:
> On Thu, Sep 03, 2026 at 10:42:48AM +0300, Mathias Nyman wrote:
> > On 9/2/26 21:21, Lovekesh Solanki wrote:
> > > On Wed, Sep 02, 2026 at 03:10:41PM +0300, Mathias Nyman wrote:
> > > > It's possible PCI side or pm core already provides some easy way for xhci driver to check this.
> > > > This specific issue is currently not on my todo list, yet.
> > > Alright, would you like to me to work on this? I could look into
> > > that side and possibly come up with an approach.
> > 
> > Yes, please, that would be great.
> I took a look at the PCI / PM side, and it seems to me there isn't any
> reliable approach for xhci driver to use right now.
> 
> The pci_check_pme_status() both checks and clears the pme status bit 
> and the pci core devours it inside pci_pme_wakeup(), and 
> pm_request_resume is async so xhci's runtime_resume may run much later
> after the bit is already gone. We can't simply export pci_check_pme_status()
> that wouldn't give any useful info.
> 
> One solution I can think of would be adding a pme_wake_detected bitfield
> on pci_dev struct, we set it in pci_pme_wakeup() when PME is confirmed
> and we clear it in pci_pm_runtime_resume() after the driver has
> returned.
> Then, we could directly read via pdev->pme_wake_detected in its own
> resume.
> 
> What are your thoughts on this?

Hey Mathias,

Just wondering if you have looked into the proposal above.
I suggested adding a new field to pci_dev struct for knowing whether a
resume came from PCI PME side.

Would it be better to send it as an RFC too?

Thanks,
Lovekesh
